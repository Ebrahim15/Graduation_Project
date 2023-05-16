import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/esp-connection-tutorial/cubit/states.dart';

class EspCubit extends Cubit<EspStates> {
  EspCubit() : super(EspInitial());
  static EspCubit get(context) => BlocProvider.of(context);

  late bool automatedSwitch;

  late bool waterPumpValue;

  late int sensorReading;

  final dataBase = FirebaseDatabase.instance.ref();

  void getData(){
    emit(GetData());
     dataBase.child('Esp').once().then((snap) {
      var snapshot = snap.snapshot.value as Map;
        automatedSwitch = snapshot['carMove'] == 1;
        sensorReading = snapshot['SoilMoisture']['reading'];
        waterPumpValue = snapshot['waterPump'] == 1;
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
    emit(LedPressed());
    automatedSwitch = !automatedSwitch;
    final child = dataBase.child('Esp/');
    int boolString = automatedSwitch ? 1 : 6;
    child.update({"carMove": boolString});
    // child.update({"minutes": 35});
    emit(LedChanged());
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
    int boolString = waterPumpValue ? 1 : 6;

    final child = dataBase.child('Esp/');

    child.update({"waterPump": boolString});
    getData();
    // child.update({"minutes": 35});
    emit(WaterPumped());
  }

  void soilMoisture(int direction){
    emit(ReleaseSoilMoistureSensor());

    // final child = dataBase.child('Esp/');

    final child = dataBase.child('Esp/SoilMoisture');

    child.update({"mode": direction});

    getData();
    // child.update({"minutes": 35});
    emit(SoilMoistureSensorReleased());
  }
}

