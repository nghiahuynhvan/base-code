import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/app_router.dart';
import '../../core/routing/routing_path.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

/// {@template splash_screen_bloc}
/// [SplashScreenBloc] returns [Stream] of [SplashScreenEvent] as input
/// and transforms them into a [Stream] of [SplashScreenState] as output.
/// {@endtemplate}
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  ///{@macro splash_screen_bloc}
  SplashScreenBloc() : super(SplashInitial()) {
    on<SplashStarted>(_started);
    on<_SplashTimerTicked>(_timerTicked);
    on<SplashMoveToApp>(_moveToApp);
  }

  StreamSubscription<int>? _tickerSubscription;
  final GlobalKey<NavigatorState> rootNavigationState = GlobalKey();

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _started(SplashStarted event, Emitter emit) async {
    // AppStatus.setStatusAppAlreadyInside(isReadyInside: true);
    // await diAuthServiceable.initialize();
    print('>>>>>>>home');
    AppRouter.rootNavigationState.currentState?.context.go(Routers.home);
  }

  void _moveToApp(SplashMoveToApp event, Emitter emit) {
    emit(const SplashComplete());
  }

  void _timerTicked(_SplashTimerTicked event, Emitter emit) {
    print("11111111");
    if (event.duration > 10) {
      print("222222");
      emit(SplashRunInProgress(event.duration));
    } else {
      print("333333");
      emit(const SplashComplete());
    }
  }
}
