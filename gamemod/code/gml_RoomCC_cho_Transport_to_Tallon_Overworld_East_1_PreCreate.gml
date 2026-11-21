self.dir = "Down";
self.destination = tal_Transport_to_Chozo_Ruins_East;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);