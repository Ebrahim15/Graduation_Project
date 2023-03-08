import 'package:flutter/material.dart';
import 'package:graduation_project/modules/controler/controler-screen.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:flutter/services.dart';
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
   Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height*0.3,
           // color: Color(0xFFDCEFDC),
            child: Stack(
              children: [
               Container(
                 height: size.height*0.3-27,
                 decoration: const BoxDecoration(
                     color: Color(0xFFDCEFDC),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(20),
                     bottomRight: Radius.circular(20),
                   )
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(30.0),
                   child: Row(
                     children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text(
                             'Hi Khaled!',
                             style: TextStyle(
                               color: Color(0xFF5EAC59),
                               fontWeight: FontWeight.bold,
                               fontSize: 28,
                             ),
                           ),
                           Text(
                             "Let's get you going",
                             style: TextStyle(
                               color: Color(0xFF5EAC59),
                               fontWeight: FontWeight.bold,
                               fontSize: 28,
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                    ),
                    child: Row(
                      children: [
                        homeCard(
                            cardMasage:'Start mowing' ,
                            cardImage:'assets/images/grass_cutter2.png',
                          boxSz: 0,
                          imgHigh: 130,
                          imgWid: 130,
                          ontap: (){ Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Grscreen();
                              },
                            ),
                                (_) => false,
                          );
                          },
                        ),
                        const SizedBox(
                          width:20 ,
                        ),
                        homeCard(
                          cardMasage:'Check your readings' ,
                          cardImage:'assets/images/soil1.png',
                          // imgHigh: ,
                          // imgWid: ,
                          ontap: (){},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 20,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        homeCard(
                          cardMasage:'Tell us your feedback' ,
                          cardImage:'assets/images/feedback2.png',
                          // imgHigh: ,
                          // imgWid: ,
                          ontap: (){},
                        ),
                        const SizedBox(
                          width:20 ,
                        ),
                        homeCard(
                          cardMasage:'About us' ,
                          cardImage:'assets/images/aboutus1.png',
                          // imgHigh: ,
                          // imgWid: ,
                          ontap: (){},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ],
      ),

      );
  }
}
// Card(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20)
//   ),
//   elevation: 0.2,
//   child: InkWell(
//     borderRadius: BorderRadius.circular(20.0),
//     splashColor: Colors.green.withAlpha(30),
//     onTap: () {
//       debugPrint('Card tapped.');
//     },
//     child: Container(
//       width:150 ,
//       height:150 ,
//       child: Column(
//         children:[
//           Expanded(
//             child: Image(
//               image:AssetImage( 'assets/images/soil1.png'),
//               height: 100,
//               width: 100,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Text(
//               'Start Mowing',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFF00A429),
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
//   Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: GestureDetector (
//     onTap: (){Navigator.push(context, MaterialPageRoute(
//         builder: (context)=>Settings()));},
//     child: Row(
//       children: [
//         const Expanded(
//           child: Text(
//             'Start Mowing',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Color(0xFF00A429),
//               fontSize: 35,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20.0),
//           child: Container(
//             height: 130,
//             width: 130,
//             color:Colors.white,
//             child:Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Image.asset('assets/images/grass_cutter3.jpeg'),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
//   Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: GestureDetector (
//       onTap: (){Navigator.push(context, MaterialPageRoute(
//           builder: (context)=>HomeScreen()));},
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Container(
//               height: 130,
//               width: 130,
//               color:Colors.white,
//               child:Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image.asset('assets/images/soil1.png'),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           const Expanded(
//             child: Text(
//               'Soil Readings',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFF00A429),
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: GestureDetector (
//       onTap: (){Navigator.push(context, MaterialPageRoute(
//           builder: (context)=>HomeScreen()));},
//       child: Row(
//         children: [
//           const Expanded(
//             child: Text(
//               'About us',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFF00A429),
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Container(
//               height: 130,
//               width: 130,
//               color:Colors.white,
//               child:Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image.asset('assets/images/aboutus1.png'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: GestureDetector (
//       onTap: (){Navigator.push(context, MaterialPageRoute(
//           builder: (context)=>HomeScreen()));},
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Container(
//               height: 130,
//               width: 130,
//               color:Colors.white,
//               child:Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image.asset('assets/images/feedback2.png'),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 20,
//           ),
//            Expanded(
//             child: Text(
//               'Tell us your Feedback',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xFF00A429),
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),


