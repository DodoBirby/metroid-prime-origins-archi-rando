self.destination = tal_Transport_to_Magmoor_Caverns_East;
// -- MW Change: Handle Elevator Rando, add direction
self.dir = "Up"
self.destination = handle_elevator_rando(room, self.destination);