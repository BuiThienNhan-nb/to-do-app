import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:to_do_app/config/dimens.dart';
import 'package:to_do_app/config/styles.dart';
import 'package:to_do_app/features/home/presentation/pages/profile_page.dart';

import '../../../../config/colors.dart';
import '../../../../config/routes.dart';
import '../../../note/presentation/pages/note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Navigation List Widgets
    final List<Widget> _screens = [
      const NotePage(),
      const ProfilePage(),
      // const SignOutPage(),
    ];

    /// Navigation Bottom Bar Items
    final List<PersistentBottomNavBarItem> _items = [
      PersistentBottomNavBarItem(
        title: "Home",
        textStyle: AppStyles.subtitle2TextStyle,
        icon: Image.asset('assets/icons/home_active_icon.png'),
        inactiveIcon: Image.asset('assets/icons/home_icon.png'),
        activeColorPrimary: AppColors.boneColor,
        activeColorSecondary: AppColors.endeavourColor,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Profile",
        textStyle: AppStyles.subtitle2TextStyle,
        icon: Image.asset('assets/icons/personal_active_icon.png'),
        inactiveIcon: Image.asset('assets/icons/personal_icon.png'),
        activeColorPrimary: AppColors.boneColor,
        activeColorSecondary: AppColors.endeavourColor,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
    ];

    final double _navBarHeight = 72.h;

    return PersistentTabView(
      context,
      screens: _screens,
      items: _items,
      confineInSafeArea: true,
      popActionScreens: PopActionScreensType.all,
      backgroundColor: AppColors.boneColor,
      navBarHeight: _navBarHeight,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.cardRadius),
          topRight: Radius.circular(AppDimens.cardRadius),
        ),
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      padding: NavBarPadding.only(top: 12.h, bottom: 16.h),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
