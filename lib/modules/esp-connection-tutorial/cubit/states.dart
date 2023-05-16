abstract class EspStates {}

class EspInitial extends EspStates {}

class GetData extends EspStates {}

class DataReceived extends EspStates {}

class LedPressed extends EspStates {}

class LedChanged extends EspStates {}

class MoveCar extends EspStates {}

class CarMoved extends EspStates {}

class ReleaseSoilMoistureSensor extends EspStates {}

class SoilMoistureSensorReleased extends EspStates {}

class PumpWater extends EspStates {}

class WaterPumped extends EspStates {}