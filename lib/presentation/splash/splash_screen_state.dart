part of 'splash_screen_bloc.dart';

/// {@template splash_screen_state}
/// Base class for all [SplashScreenState]s which are
/// managed by the [SplashScreenBloc].
/// {@endtemplate}
@immutable
sealed class SplashScreenState extends Equatable {
  /// {@macro splash_screen_state}
  const SplashScreenState();

  @override
  List<Object?> get props => [];
}

/// The initial state of the [SplashScreenBloc].
final class SplashInitial extends SplashScreenState {}

/// {@template splash_run_in_progress}
/// The state of the [SplashScreenBloc] when timer is running.
/// {@endtemplate}
final class SplashRunInProgress extends SplashScreenState {
  /// {@macro splash_run_in_progress}
  const SplashRunInProgress(this.duration);

  /// Duration current
  final int duration;

  @override
  List<Object?> get props => [duration];
}

/// {@template splash_complete}
/// The state of the [SplashScreenBloc] after completed.
/// {@endtemplate}
final class SplashComplete extends SplashScreenState {
  /// {@macro splash_complete}
  const SplashComplete();

  @override
  List<Object?> get props => [];
}
