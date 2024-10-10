part of 'login_page_bloc.dart';

@immutable

/// {@template login_page_event}
/// {@endtemplate}
sealed class LoginPageEvent extends Equatable {
  /// {@macro splash_screen_event}
  const LoginPageEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginPageResetEvent extends LoginPageEvent {}

class LoginPageStartEvent extends LoginPageEvent {
  const LoginPageStartEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginPageSubmitEvent extends LoginPageEvent {
  const LoginPageSubmitEvent({
    required this.email,
    required this.password,
    required this.context,
  });
  ///Text input
  final String email;
  ///Text input
  final String password;
  /// Build context;
  final BuildContext context;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
