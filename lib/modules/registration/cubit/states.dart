import 'package:graduation_project/modules/edit_profile_screen/cubit/states.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{
  final String? uId;

  RegisterSuccessState(this.uId);
}

class RegisterErrorState extends RegisterStates{
  final String error;

  RegisterErrorState(this.error);
}
class CreateUserSuccessState extends RegisterStates{}

class CreateUserErrorState extends RegisterStates{
  final String error;

  CreateUserErrorState(this.error);
}

class ChangePasswordVisibilityState extends RegisterStates{}

class SaveRegisterDataSuccess extends RegisterStates{}

class SaveRegisterDataLoading extends RegisterStates{}

class SaveRegisterDataError extends RegisterStates{
  final String error;

  SaveRegisterDataError(this.error);
}

// class EditProfile extends RegisterStates{}
//
// class EditProfileSuccess extends RegisterStates{}

// class AppGetUserLoadingState extends RegisterStates{}
//
// class AppGetUserSuccessState extends RegisterStates{}
//
// class AppGetUserErrorState extends RegisterStates{
//   final String error;
//
//   AppGetUserErrorState(this.error);
// }