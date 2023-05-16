abstract class ChangePasswordStates {}

class ChangePasswordInitialState extends ChangePasswordStates{}

class ChangePasswordLoadingState extends ChangePasswordStates{}

class ChangePasswordSuccessState extends ChangePasswordStates{
  final String? uId;

  ChangePasswordSuccessState(this.uId);
}

class ChangePasswordErrorState extends ChangePasswordStates{
  final String error;

  ChangePasswordErrorState(this.error);
}
class CreateUserSuccessState extends ChangePasswordStates{}

class CreateUserErrorState extends ChangePasswordStates{
  final String error;

  CreateUserErrorState(this.error);
}

class ChangePasswordVisibilityState extends ChangePasswordStates{}

class SaveChangePasswordDataSuccess extends ChangePasswordStates{}

class SaveChangePasswordDataLoading extends ChangePasswordStates{}

class SaveChangePasswordDataError extends ChangePasswordStates{
  final String error;

  SaveChangePasswordDataError(this.error);
}