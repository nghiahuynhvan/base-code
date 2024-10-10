import 'package:code_base/core/routing/app_router.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/routing_path.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitState()) {
    on<LoginPageStartEvent>(_onStart);
    on<LoginPageSubmitEvent>(_onSubmit);
  }

  void _onStart(LoginPageStartEvent event, Emitter emit) {
    emit(const LoginPageLoadedState());
  }

  void _onSubmit(LoginPageSubmitEvent event, Emitter emit) async {
    try {
      final userCritial = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.email, password: event.password);
      final abc = userCritial.user?.getIdToken(true);
      print('>>>>Token: ${abc.toString()}');
      print('${userCritial.user!.email}');
      _movetoHome(event.context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

void _movetoHome(BuildContext context) {
  context.go(Routers.home);
}

Future<void> _handleLoginByEmail(String email, String password) async {}
