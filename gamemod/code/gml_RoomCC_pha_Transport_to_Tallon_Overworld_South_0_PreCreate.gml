self.dir = "Up";
self.destination = tal_Transport_to_Phazon_Mines_East;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);