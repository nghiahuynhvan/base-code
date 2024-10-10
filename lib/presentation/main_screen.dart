import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/constant/data/nav_bottom_data.dart';

import '../common/enums/bottom_nav_main_screen.dart';
import '../core/language/generated/l10n.dart';
import '../core/locators/locators.dart';
import '../core/routing/app_router.dart';
import '../core/routing/routing_path.dart';
import '../core/style/app_colors.dart';
import '../core/style/app_text_style.dart';

/// {@template main_screen}
/// [MainScreen] returns a widget that has mutable state [_MainScreenState].
/// The place contains the main pages of the app
/// that the user uses when successfully logged in.
/// {@endtemplate}
class MainScreen extends StatefulWidget {
  /// {@macro main_screen}
  const MainScreen({
    super.key,
    required this.navShell,
  });

  /// View need display with navigation bar bottom
  final StatefulNavigationShell navShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final AppRouter appRouter;
  BottomNavMainScreen _itemNavSelected = BottomNavMainScreen.home;

  @override
  void initState() {
    appRouter = diAppRouter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.navShell,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.secondaryColor,
          selectedItemColor: AppColors.whiteColor,
          unselectedLabelStyle:
              AppTextStyle.regular12.copyWith(color: Colors.red),
          selectedLabelStyle: AppTextStyle.bold12.copyWith(color: Colors.red),
          unselectedFontSize: 12.0,
          selectedFontSize: 12.0,
          currentIndex: _calculateSelectedIndex(context).indexTab,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.ad_units), label: SLang.current.home),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person), label: SLang.current.you),
          ],
        ),
      ),
    );
  }

  BottomNavMainScreen _calculateSelectedIndex(BuildContext context) {
    final route = appRouter.router;
    final location = route.routeInformationProvider.value.uri.path;
    if (location.startsWith(Routers.home)) {
      _itemNavSelected = BottomNavMainScreen.home;
    }
    if (location.startsWith(Routers.you)) {
      _itemNavSelected = BottomNavMainScreen.you;
    }
    return _itemNavSelected;
  }

  void _onTap(int? value) {
    final index = value ?? 0;
    widget.navShell.goBranch(
      index,
      initialLocation: index == widget.navShell.currentIndex,
    );
  }
}
