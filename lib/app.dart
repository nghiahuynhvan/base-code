import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/language/generated/l10n.dart';
import 'core/locators/locators.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => diSplashScreenBloc),
      ],
      child: MaterialApp.router(
        title: 'abc',
        debugShowCheckedModeBanner: false,
        routerConfig: diAppRouter.router,
        localizationsDelegates: const [
          SLang.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: SLang.delegate.supportedLocales,
        // builder: FlutterSmartDialog.init(
        //   builder: (context, child) => MediaQuery(
        //     data: MediaQuery.of(context)
        //         .copyWith(textScaler: TextScaler.noScaling),
        //     child: child!,
        //   ),
        // ),
      ),
    );
  }
}
