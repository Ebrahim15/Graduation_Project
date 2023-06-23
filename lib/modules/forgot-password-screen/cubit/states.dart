abstract class ForgotPasswordStates {}

class ResetPasswordInitialState extends ForgotPasswordStates{}

class ResetPasswordLoadingState extends ForgotPasswordStates{}

class ResetPasswordSuccessState extends ForgotPasswordStates{}

class PasswordVisibilityState extends ForgotPasswordStates{}

class SendEmailVerificationState extends ForgotPasswordStates{}

class SendEmailVerificationSuccessState extends ForgotPasswordStates{}

class SendEmailVerificationErrorState extends ForgotPasswordStates{
  final String error;

  SendEmailVerificationErrorState(this.error);
}