part of 'login_page_bloc.dart';

@immutable
class LoginPageState extends Equatable {
  const LoginPageState();

  @override
  List<Object?> get props => [];
}

class LoginPageInitState extends LoginPageState {}

class LoginPageResetState extends LoginPageState {}

class LoginPageStartState extends LoginPageState {}

class LoginPageLoadedState extends LoginPageState {
  const LoginPageLoadedState();

  @override
  List<Object?> get props => [];
}
