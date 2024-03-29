import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/control-mode/control-mode-screen.dart';
import 'package:graduation_project/modules/controler/controler-screen.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';
import 'package:graduation_project/shared/components/components.dart';

import 'package:flutter/services.dart';

import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';



class HomeScreen extends StatelessWidget {
  String s ="ddfd";
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var model = AppCubit.get(context).model;
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
                              children: [
                                Text(
                                  'Hi ${model?.name ?? "..."}',
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
                          ontap:(){
                            navigateRootAndFinish(context, ControlModeScreen());
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
      },
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


