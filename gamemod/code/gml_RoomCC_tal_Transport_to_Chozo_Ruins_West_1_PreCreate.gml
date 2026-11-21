self.dir = "Up";
self.destination = cho_Transport_to_Tallon_Overworld_North;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);