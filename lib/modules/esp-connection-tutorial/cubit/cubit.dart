import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/esp-connection-tutorial/cubit/states.dart';

class EspCubit extends Cubit<EspStates> {
  EspCubit() : super(EspInitial());
  static EspCubit get(context) => BlocProvider.of(context);

  late bool automatedSwitch;

  late bool routedSwitch;

  late bool waterPumpValue;

  late bool bladeValue;

  late int sensorReading;

  late int carMove;
  final dataBase = FirebaseDatabase.instance.ref();

  void getData(){
    emit(GetData());
     dataBase.child('Esp').once().then((snap) {
      var snapshot = snap.snapshot.value as Map;
        automatedSwitch = snapshot['carMove'] == 6;
        routedSwitch = snapshot['carMove'] == 7;
        carMove = snapshot['carMove'];
        sensorReading = snapshot['SoilMoisture']['reading'];
        waterPumpValue = snapshot['waterPump'] == 8;
        // bladeValue = snapshot['blade'] == 12;
        // bladeValue = snapshot['waterPump'] == 12;
      emit(DataReceived());
     });


    // dataBase.child('Esp/SoilMoisture').once().then((snap) {
    //   var snapshot = snap.snapshot.value as Map;
    //   sensorReading = snapshot['reading'];
    //
    //   emit(DataReceived());
    // });

    dataBase.child('Esp/SoilMoisture').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;

      if(snap.key == "reading"){
        sensorReading = snap.value as int ;
        // print(snap.value.runtimeType);

        emit(DataReceived());
      }
    });
  }

  void autoModeSwitch(){
    emit(AutoModePressed());
    automatedSwitch = !automatedSwitch;
    final child = dataBase.child('Esp/');
    int boolString = automatedSwitch ? 6 : 1;
    child.update({"carMove": boolString});
    // child.update({"minutes": 35});
    emit(AutoModeChanged());
  }
  void routedModeSwitch(){
    emit(AutoModePressed());
    routedSwitch = !routedSwitch;
    final child = dataBase.child('Esp/');
    int boolString = routedSwitch ? 7 : 1;
    child.update({"carMove": boolString});
    // child.update({"minutes": 35});
    emit(AutoModeChanged());
  }
  void moveCar(int direction){
    emit(MoveCar());

    // final child = dataBase.child('Esp/');

    final child = dataBase.child('Esp/');

    child.update({"carMove": direction});
    getData();
    // child.update({"minutes": 35});
    emit(CarMoved());
  }
  void waterPumpSwitch(){
    emit(PumpWater());

    waterPumpValue = !waterPumpValue;
    int boolString = waterPumpValue ? 8 : 9;

    final child = dataBase.child('Esp/');

    child.update({"waterPump": boolString});
    getData();
    // child.update({"minutes": 35});
    emit(WaterPumped());
  }

  // void bladeSwitch(){
  //   emit(BladePressed());
  //
  //   bladeValue = !bladeValue;
  //   int boolString = bladeValue ? 12 : 13;
  //
  //   final child = dataBase.child('Esp/');
  //
  //   // child.update({"blade": boolString});
  //   child.update({"waterPump": boolString});
  //   getData();
  //   // child.update({"minutes": 35});
  //   emit(BladeChanged());
  // }

  void soilMoisture(int direction){
    emit(ReleaseSoilMoistureSensor());

    // final child = dataBase.child('Esp/');

    // final child = dataBase.child('Esp/SoilMoisture');

    final child = dataBase.child('Esp/');

    // child.update({"mode": direction});
    child.update({"carMove": direction});

    getData();
    // child.update({"minutes": 35});
    emit(SoilMoistureSensorReleased());
  }

  void routeDimensions({required x, required y}){
    emit(GetRouteDimensions());
    final child = dataBase.child('Esp/dimensions');

    child.update({"x": x, "y":y});

    emit(GetRouteDimensionsSuccessful());
  }
}

