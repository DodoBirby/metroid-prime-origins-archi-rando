from worlds.LauncherComponents import Component, Type, components, launch

def run_client(*args: str) -> None:
    from .client import launch as launch_mpo_client

    launch(launch_mpo_client, name="Metroid Prime Origins Client", args=args)

components.append(
    Component(
        "Metroid Prime Origins Client",
        func=run_client,
        game_name="Metroid Prime Origins",
        component_type=Type.CLIENT,
    )
)
