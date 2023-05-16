import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/models/user_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class LogOutState extends AppStates{}

class AppChangeScreenModeState extends AppStates{}
// class AppGetProfileData extends AppStates{}
