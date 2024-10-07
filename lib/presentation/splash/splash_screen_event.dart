part of 'splash_screen_bloc.dart';

/// {@template splash_screen_event}
/// Base class for all [SplashScreenEvent]s which are
/// handled by the [SplashScreenBloc].
/// {@endtemplate}
@immutable
sealed class SplashScreenEvent extends Equatable {
  /// {@macro splash_screen_event}
  const SplashScreenEvent();

  @override
  List<Object?> get props => [];
}

/// {@template splash_started}
/// Signifies to the [SplashScreenBloc] that the app
/// has requested to start time.
/// {@endtemplate}
final class SplashStarted extends SplashScreenEvent {
   const SplashStarted();
   @override
   List<Object?> get props => [];
}

/// {@template splash_move_to_app}
/// Move to main screen
/// {@endtemplate}
final class SplashMoveToApp extends SplashScreenEvent {
  /// {@macro splash_move_to_app}
  const SplashMoveToApp();

  @override
  List<Object?> get props => [];
}

/// {@template splash_timer_ticked}
/// [_SplashTimerTicked] is private function, it used internal in [SplashScreenBloc]
/// Signifies to the [SplashScreenBloc] that the timer
/// has ticked a duration.
/// {@endtemplate}
final class _SplashTimerTicked extends SplashScreenEvent {
  /// {@macro splash_closed}
  const _SplashTimerTicked(this.context, this.duration);

  /// Context of view
  final BuildContext context;

  final int duration;

  @override
  List<Object?> get props => [context, duration];
}
