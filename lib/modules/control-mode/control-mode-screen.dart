import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/auto-mode/auto-mode-screen.dart';
import 'package:graduation_project/modules/routed-mode/routed-mode-screen.dart';
// import 'package:graduation_project/modules/controler/controler-screen.dart';

import '../../shared/components/components.dart';
import '../controler_screen/controler-screen.dart';

class ControlModeScreen extends StatelessWidget {
  const ControlModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Mode",style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF063C14),
            size: 30,
          ),
          onPressed: (){
            navigateRootAndFinish(context,AppLayout());
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    homeCard(
                      cardMasage:'Auto mode' ,
                      cardImage:'assets/images/grass_cutter2.png',
                      boxSz: 0,
                      imgHigh: 130,
                      imgWid: 130,
                      ontap:(){
                        navigateRootAndFinish(context, AutoModeScreen());
                      },
                    ),
                    const SizedBox(
                      width:20 ,
                    ),
                    homeCard(
                      cardMasage:'Manual mode' ,
                      cardImage:'assets/images/control-pad-green.jpg',
                      // imgHigh: ,
                      // imgWid: ,
                      ontap: (){
                        navigateRootAndFinish(context, Grscreen());
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                homeCard(
                  cardMasage:'Route mode (Demo)' ,
                  cardImage:'assets/images/route.png',
                  boxSz: 0,
                  imgHigh: 130,
                  imgWid: 130,
                  ontap:(){
                    navigateRootAndFinish(context, RoutedModeScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
