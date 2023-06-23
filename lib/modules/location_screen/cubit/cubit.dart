import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/location_screen/cubit/states.dart';

import '../../../shared/cubit/states.dart';

class LocationCubit extends Cubit<LocationStates>{
  LocationCubit() : super(LocationInitialState());

  static LocationCubit get(context) => BlocProvider.of(context);

  final dataBase = FirebaseDatabase.instance.ref();

  late double longitude;

  late double latitude;

  void getLocation(){
    emit(GetLocationLoading());
    dataBase.child('Esp').once().then((snap) {
      var snapshot = snap.snapshot.value as Map;
      longitude = snapshot['Location']['longitude'];

      latitude = snapshot['Location']['latitude'];

      emit(LocationReceived());
    });


    dataBase.child('Esp/Location').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;

      if(snap.key == "latitude"){
        latitude = snap.value as double ;
        // print(snap.value.runtimeType);

        emit(LocationReceived());
      }
      else if(snap.key == "longitude"){
        longitude = snap.value as double ;
        // print(snap.value.runtimeType);

        emit(LocationReceived());
      }
    });
  }
}