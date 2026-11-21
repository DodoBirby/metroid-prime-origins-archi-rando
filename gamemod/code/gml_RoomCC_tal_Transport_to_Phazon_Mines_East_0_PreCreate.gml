self.dir = "Down";
self.destination = pha_Transport_to_Tallon_Overworld_South;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);