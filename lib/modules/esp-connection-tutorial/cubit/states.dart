abstract class EspStates {}

class EspInitial extends EspStates {}

class GetData extends EspStates {}

class DataReceived extends EspStates {}

class AutoModePressed extends EspStates {}

class AutoModeChanged extends EspStates {}

class BladePressed extends EspStates {}

class BladeChanged extends EspStates {}

class MoveCar extends EspStates {}

class CarMoved extends EspStates {}

class ReleaseSoilMoistureSensor extends EspStates {}

class SoilMoistureSensorReleased extends EspStates {}

class PumpWater extends EspStates {}

class WaterPumped extends EspStates {}

class GetRouteDimensions extends EspStates{}

class GetRouteDimensionsSuccessful extends EspStates{}
