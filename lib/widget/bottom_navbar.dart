import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:veegil_bank/component/color.dart';
import 'package:veegil_bank/component/style.dart';
import 'package:veegil_bank/home_page.dart';
import 'package:veegil_bank/widget/drawer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

PersistentTabController? _controller;

class _BottomNavBarState extends State<BottomNavBar> {
  //bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    //_hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColor
          .lightGrey, //const Color(0xff1D1416), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const MyDrawer(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      textStyle: style.copyWith(fontSize: 11),
      icon: const Icon(
        Icons.home_outlined,
        size: 22,
      ),
      title: "Dashboard",
      activeColorPrimary: AppColor.orange,
      inactiveColorPrimary: Colors.black.withOpacity(0.6),
    ),
    PersistentBottomNavBarItem(
      textStyle: style.copyWith(fontSize: 12),
      icon: const Icon(
        Icons.compare_arrows,
        size: 22,
      ),
      title: ("Transfer"),
      activeColorPrimary: AppColor.orange,
      inactiveColorPrimary: Colors.black.withOpacity(0.6),
    ),
    PersistentBottomNavBarItem(
      textStyle: style.copyWith(fontSize: 12),
      icon: const Icon(
        Icons.phone_android,
        size: 22,
      ),
      title: ("Top Up"),
      activeColorPrimary: AppColor.orange,
      inactiveColorPrimary: Colors.black.withOpacity(0.6),
    ),
    PersistentBottomNavBarItem(
      textStyle: style.copyWith(fontSize: 12),
      icon: const Icon(
        Icons.person_outline,
        size: 22,
      ),
      title: ("Profile"),
      activeColorPrimary: AppColor.orange,
      inactiveColorPrimary: Colors.black.withOpacity(0.6),
    ),
  ];
}
