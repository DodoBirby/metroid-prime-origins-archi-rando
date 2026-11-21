self.dir = "Down";
self.destination = mag_Transport_to_Tallon_Overworld_West;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);