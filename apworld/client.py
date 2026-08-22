import asyncio
from asyncio import StreamReader, StreamWriter
import json

from Utils import async_start, gui_enabled
from CommonClient import CommonContext, get_base_parser, logger, server_loop 

from .locations import LOCATION_NAME_TO_ID, LOCATION_TABLE
from .items import ITEM_NAME_TO_ID

PORT_NUMBER = 64200
location_name_to_game_key = { location_name: data.location_key for location_name, data in LOCATION_TABLE.items() }
location_id_to_game_key = { id: location_name_to_game_key[name] for name, id in LOCATION_NAME_TO_ID.items() }
item_id_to_item_name = { id: name for name, id in ITEM_NAME_TO_ID.items() }
game_key_to_location_id = { key: id for id, key in location_id_to_game_key.items() }

class MPOContext(CommonContext):
    game = "Metroid Prime Origins"
    items_handling = 0b111 # full remote

    def __init__(self, server_address, password):
        super().__init__(server_address, password)
        self.mpo_streams: tuple[StreamReader, StreamWriter] | None = None
        self.client_requesting_scouts: bool = False
        self.mpo_sync_task: asyncio.Task[None] | None = None

    async def server_auth(self, password_requested: bool = False):
        if password_requested and not self.password:
            _ = await super(MPOContext, self).server_auth(password_requested)
        await self.get_username()
        await self.send_connect()

def create_items_payload(ctx: MPOContext) -> str:
    itemnames_received = [ item_id_to_item_name[netitem.item] for netitem in ctx.items_received if netitem.item in item_id_to_item_name ]
    majors: list[str] = []
    etanks = 0
    missiletanks = 0
    pbombtanks = 0
    for itemname in itemnames_received:
        match itemname:
            case "Energy Tank":
                etanks += 1
            case "Missile Tank":
                missiletanks += 1
            case "Power Bomb":
                pbombtanks += 1
            case _:
                majors.append(itemname)
    return json.dumps({
        "cmd": "items",
        "etanks": etanks,
        "missiletanks": missiletanks,
        "pbombtanks": pbombtanks,
        "majors": majors
    })

def get_payload(ctx: MPOContext) -> str:
    items_to_give = [ item_id_to_item_name[netitem.item] for netitem in ctx.items_received if netitem.item in item_id_to_item_name ]
    if not ctx.locations_info:
        async_start(ctx.send_msgs([{ "cmd": "LocationScouts", "locations": list(LOCATION_NAME_TO_ID.values()), "create_as_hint": 0 }]))
        return create_items_payload(ctx)

    if ctx.client_requesting_scouts:
        items_dict: dict[str, str] = {}
        for locationid, netitem in ctx.locations_info.items():
            # TODO: Handle sprites for other games
            if not ctx.slot_concerns_self(netitem.player):
                continue
            location_key = location_id_to_game_key[locationid]
            items_dict[location_key] = item_id_to_item_name[netitem.item]
        return json.dumps({
            "cmd": "locations",
            "locations": items_dict,
        })
    return create_items_payload(ctx)

async def parse_payload(ctx: MPOContext, data_decoded: dict[str, str]):
    locations_checked = [game_key_to_location_id[location] for location in data_decoded["items"]]
    game_finished = bool(int(data_decoded["gamecompleted"]))
    ctx.client_requesting_scouts = bool(int(data_decoded["seedreceived"]))
    location_set = set(locations_checked)
    ctx.locations_checked = location_set
    new_locations = [location for location in ctx.missing_locations if location in location_set]
    if new_locations:
        await ctx.send_msgs([{"cmd": "LocationChecks", "locations": new_locations}])
    if game_finished and not ctx.finished_game:
        await ctx.send_msgs([{"cmd": "StatusUpdate", "status": 30}])
        ctx.finished_game = True

async def connect_to_mpo(ctx: MPOContext):
    try:
        ctx.mpo_streams = await asyncio.wait_for(asyncio.open_connection("127.0.0.1", PORT_NUMBER), timeout=10)
    except TimeoutError:
        logger.debug("Connection timed out, trying again...")
    except ConnectionRefusedError:
        logger.debug("Connection refused, trying again...")

async def mpo_sync_task(ctx: MPOContext):
    logger.info("Staring MPO connector.")
    while not ctx.exit_event.is_set():
        await asyncio.sleep(1)
        if not ctx.mpo_streams:
            await connect_to_mpo(ctx)
            continue
        (reader, writer) = ctx.mpo_streams
        msg = get_payload(ctx).encode()
        writer.write(msg)
        writer.write(b'\n')
        try:
            await asyncio.wait_for(writer.drain(), timeout=1.5)
            try:
                data = await asyncio.wait_for(reader.readline(), timeout=5)
                data_decoded: dict[str, str] = json.loads(data.decode())
                await parse_payload(ctx, data_decoded)
            except TimeoutError:
                logger.debug("Read timed out, reconnecting...")
                writer.close()
                ctx.mpo_streams = None
                continue
            except ConnectionResetError:
                logger.debug("Read failed due to connection error, reconnecting...")
                writer.close()
                ctx.mpo_streams = None
        except TimeoutError:
            logger.debug("Connection Timed Out, Reconnecting")
            writer.close()
            ctx.mpo_streams = None
        except ConnectionResetError:
            logger.debug("Connection Lost, Reconnecting")
            writer.close()
            ctx.mpo_streams = None


async def main(args):
    ctx = MPOContext(args.connect, args.password)
    ctx.server_task = asyncio.create_task(server_loop(ctx), name="server loop")
    ctx.mpo_sync_task = asyncio.create_task(mpo_sync_task(ctx), name="mpo sync task")
    if gui_enabled:
        ctx.run_gui()
    ctx.run_cli()
    _ = await ctx.exit_event.wait()
    await ctx.shutdown()

def launch():
    import colorama

    parser = get_base_parser(description="Metroid Prime Origins Game Client")
    _ = parser.add_argument("url", nargs="?", help="Archipelago connection url")
    args = parser.parse_args()

    # use colorama to display colored text highlighting on windows
    colorama.just_fix_windows_console()

    asyncio.run(main(args))
    colorama.deinit()

if __name__ == "__main__":
    launch()
