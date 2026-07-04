abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess({required this.token});
}
class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure({required this.errMessage});
}


class ForgotPasswordLoading extends AuthState {}
class ForgotPasswordSuccess extends AuthState {
  final String message;
  ForgotPasswordSuccess(this.message);
}
class ForgotPasswordFailure extends AuthState {
  final String errMessage;
  ForgotPasswordFailure(this.errMessage);
}