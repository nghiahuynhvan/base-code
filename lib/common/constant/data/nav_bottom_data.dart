import 'package:flutter/material.dart';

/// {@template nav_bottom_data}
/// [NavBottomData] contains the prototypes of all the data item for
/// menu bottom navigation bar.
///
/// Functions includes:
/// [getNavBottomItemsData]
/// [lengthItemsData]
/// {@endtemplate}
class NavBottomData {
  /// This function to get all items data
  ///
  /// [context] : Get language value from context view.
  List<MainNavBottomItem> getNavBottomItemsData({BuildContext? context}) => [
        MainNavBottomItem(label: 'Home', icon: const Icon(Icons.home)),
        MainNavBottomItem(label: 'You', icon:const Icon(Icons.person)),
      ];

  /// This function to get length items data
  int lengthItemsData() {
    return getNavBottomItemsData().length;
  }
}

/// This class create some items model for menu bottom navigation bar, include:
/// [label] of bottom navigation bar item.
/// [icon] of bottom navigation bar item.
/// [activeIcon] of bottom navigation bar item.
/// [isActive] of bottom navigation bar item.
class MainNavBottomItem {
  /// Label of bottom navigation bar item.
  String label;

  /// Icon of bottom navigation bar item.
  Widget icon;

  /// Icon active of bottom navigation bar item.
  Widget? activeIcon;

  /// Is active of bottom navigation bar item.
  bool isActive;

  /// Constructor
  MainNavBottomItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    this.isActive = true,
  });

  /// Creating a new [MainNavBottomItem] instance from a map structure.
  factory MainNavBottomItem.fromMap(Map<String, dynamic> map) =>
      MainNavBottomItem(
        label: map['title'],
        icon: map['icon'],
        activeIcon: map['activeIcon'],
        isActive: map['isActive'],
      );
}
