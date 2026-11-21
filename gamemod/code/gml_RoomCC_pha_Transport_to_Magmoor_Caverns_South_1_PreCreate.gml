self.dir = "Up";
self.destination = mag_Transport_to_Phazon_Mines_West;
// -- MW Change: Handle Elevator Rando
self.destination = handle_elevator_rando(room, self.destination);