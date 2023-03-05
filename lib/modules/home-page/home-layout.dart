import 'package:flutter/material.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';
//import 'package:graduation_project/modules/profile/profile_screen.dart';
//import 'package:graduation_project/modules/settings/settings_screen.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class BottomNavBar extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//
//     List<Widget> _buildScreens() {
//       return [
//         HomeScreen(),
//         Settings(),
//         Profile(),
//         // MainScreen(),
//         // SettingsScreen()
//       ];
//     }
//     List<PersistentBottomNavBarItem> _navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.home_outlined),
//           title: ("Home"),
//           activeColorPrimary:Colors.green,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.account_circle),
//           title: ("profile"),
//           activeColorPrimary:Colors.green,
//           inactiveColorPrimary: Colors.grey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.settings_outlined),
//           title: ("Settings"),
//           activeColorPrimary:Colors.green,
//           inactiveColorPrimary: Colors.grey,
//         ),
//       ];
//     }
//     PersistentTabController _controller;
//
//     _controller = PersistentTabController(initialIndex: 0);
//
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
//     );;
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector (
                onTap: (){Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>Settings()));},
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Start Mowing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF00A429),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 130,
                        width: 130,
                        color:Colors.white,
                        child:Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/grass_cutter3.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector (
                  onTap: (){Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()));},
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 130,
                          width: 130,
                          color:Colors.white,
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/soil1.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Expanded(
                        child: Text(
                          'Soil Readings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF00A429),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector (
                  onTap: (){Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()));},
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'About us',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF00A429),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 130,
                          width: 130,
                          color:Colors.white,
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/aboutus1.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector (
                  onTap: (){Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()));},
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 130,
                          width: 130,
                          color:Colors.white,
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/feedback2.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                       Expanded(
                        child: Text(
                          'Tell us your Feedback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF00A429),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      );
  }
}

