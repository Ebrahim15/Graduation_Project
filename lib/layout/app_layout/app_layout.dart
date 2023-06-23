import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/cubit/states.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/registration/registration_screen.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../modules/home-page/home-layout.dart';
import '../../modules/profile/profile_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../shared/network/local/cache_helper.dart';

class AppLayout extends StatefulWidget {
  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        Profile(),
        SettingsScreen(),
        // MainScreen(),
        // SettingsScreen()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: ("Home"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.account_circle),
          title: ("profile"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings_outlined),
          title: ("Settings"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    bool? isDark = CacheHelper.getData(key: 'isDark');

    return BlocProvider(
      create: (context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              // backgroundColor: HexColor('333739'),
              // scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  )),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  // color: Colors.white,
                  fontSize: 15.0,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d4d4d),
                ),
                bodySmall: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d4d4d),
                ),
              ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // backgroundColor: HexColor('333739'),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                  )),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: PersistentTabView(
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              // backgroundColor: Colors.red,
              confineInSafeArea: true,
              // backgroundColor: Colors.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
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
              navBarStyle: NavBarStyle
                  .style1, // Choose the nav bar style with this property.
            ),
          );
        },
      ),
    );
  }
}
