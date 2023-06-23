import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/control-mode/control-mode-screen.dart';
import 'package:graduation_project/modules/esp-connection-tutorial/cubit/states.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../shared/styles/colors.dart';
import '../esp-connection-tutorial/cubit/cubit.dart';

class Grscreen extends StatelessWidget {
  //const GRscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void initState() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    @override
    dispose() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    initState();
    return BlocProvider(
      create: (context) => EspCubit()..getData(),
      child: BlocConsumer<EspCubit,EspStates>(
        listener: (context, state)=>{},
        builder: (context, state) {
          EspCubit cubit = EspCubit.get(context);

          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF063C14),
                      size: 30,
                    ) ,
                    onPressed:(){
                      dispose();
                      navigateRootAndFinish(context, ControlModeScreen());
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AppLayout()),
                      // );
                    } ,
                  ) ,
                  centerTitle: true,
                  title: const Text(
                    'Controls',
                    style: TextStyle(
                        color: Color(0xFF4D4D4D)
                    ),
                  ),
                  // actions: [
                  //   IconButton(
                  //     onPressed: (){},
                  //     icon: Icon(
                  //       Icons.battery_4_bar_rounded,
                  //       color:  Color(0xFF063C14),
                  //       size: 30,
                  //     ),),
                  //   IconButton(
                  //     onPressed: (){},
                  //     icon: Icon(
                  //       Icons.settings_remote,
                  //       color:  Color(0xFF063C14),
                  //       size: 30,
                  //     ),),
                  // ],
                ),
                // floatingActionButton: FloatingActionButton(
                //   elevation: 0,
                //   backgroundColor: Colors.white,
                //   child: Icon(Icons.settings,
                //       color: Color(0xFF063C14),
                //       size: 25),
                //   onPressed: (){},
                // ),
                body:SingleChildScrollView(
                  child: Center(
                    child: ConditionalBuilder(
                      condition: state is! GetData,
                      builder:(context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      HoldDetector(
                                        onHold: () {
                                          print("FORWAAAARRRRRDDD!!!!!!!");
                                          cubit.moveCar(2);
                                        },
                                        onCancel: (){cubit.moveCar(6);},
                                        child: FloatingActionButton(
                                          heroTag: "Up",
                                          elevation: 0,
                                          backgroundColor: Color(0xFFD9DBD9),
                                          child: Icon(Icons.keyboard_arrow_up_rounded,
                                              color: Color(0xFF00A429),
                                              size: 50),
                                          onPressed: (){},
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          HoldDetector(
                                            onHold: () {
                                              cubit.moveCar(5);
                                            },
                                            onCancel: (){cubit.moveCar(6);},
                                            child: FloatingActionButton(
                                              heroTag: "Left",
                                              elevation: 0,
                                              backgroundColor: Color(0xFFD9DBD9),
                                              child: Icon(Icons.keyboard_arrow_left_rounded,
                                                  color: Color(0xFF00A429),
                                                  size: 50),
                                              onPressed: (){},
                                            ),

                                          ),
                                          SizedBox(
                                            width: 55,
                                            height:55,
                                          ),
                                          HoldDetector(
                                            onHold: () {
                                              cubit.moveCar(4);
                                            },
                                            onCancel: (){cubit.moveCar(6);},
                                            child: FloatingActionButton(
                                              heroTag: "Right",
                                              elevation: 0,
                                              backgroundColor: Color(0xFFD9DBD9),
                                              child: Icon(Icons.keyboard_arrow_right_rounded,
                                                  color: Color(0xFF00A429),
                                                  size: 50),
                                              onPressed: (){},
                                            ),

                                          ),
                                        ],),
                                      HoldDetector(
                                        onHold: () {
                                          cubit.moveCar(3);
                                        },
                                        onCancel: (){cubit.moveCar(6);},
                                        child: FloatingActionButton(
                                          heroTag: "Down",
                                          elevation: 0,
                                          backgroundColor: Color(0xFFD9DBD9),
                                          child: Icon(Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF00A429),
                                              size: 50),
                                          onPressed: (){},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pump water",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Switch(
                                          value: cubit.waterPumpValue,
                                          onChanged: (bool x) {
                                            cubit.waterPumpSwitch();
                                          },
                                          activeColor: HexColor(defaultColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Blade",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Switch(
                                          value: cubit.waterPumpValue,
                                          onChanged: (bool x) {
                                            cubit.waterPumpSwitch();
                                          },
                                          activeColor: HexColor(defaultColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Soil moisture",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  HoldDetector(
                                                    onHold: () {
                                                      cubit.soilMoisture(1);
                                                    },
                                                    onCancel: (){cubit.soilMoisture(6);},
                                                    child: FloatingActionButton(
                                                      heroTag: "Up",
                                                      elevation: 0.0,
                                                      backgroundColor:
                                                      HexColor(defaultColor),
                                                      onPressed: () {},
                                                      child: Icon(
                                                        Icons.arrow_upward,
                                                        color: Colors.white,
                                                        size: 35,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  HoldDetector(
                                                    onHold: () {
                                                      cubit.soilMoisture(2);
                                                    },
                                                    onCancel: (){cubit.soilMoisture(6);},
                                                    child: FloatingActionButton(
                                                      heroTag: "Down",
                                                      elevation: 0.0,
                                                      backgroundColor:
                                                      HexColor(defaultColor),
                                                      onPressed: () {},
                                                      child: Icon(
                                                        Icons.arrow_downward,
                                                        color: Colors.white,
                                                        size: 35,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              CircularPercentIndicator(
                                                radius: 60.0,
                                                lineWidth: 10.0,
                                                animation: true,
                                                circularStrokeCap:
                                                CircularStrokeCap.round,
                                                percent: cubit.sensorReading / 100,
                                                center: new Text(
                                                    "${cubit.sensorReading.toString()}%"),
                                                progressColor:
                                                HexColor(defaultColor),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            child: Container(
                                              height: 30,
                                              child: IconButton(
                                                onPressed: (){showHelpDialogue(context);},
                                                icon: Icon(
                                                  Icons.info_outline,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),

                              // Container(
                              //   width: 250,
                              //   height: 180,
                              //   child: Stack(
                              //     children: [
                              //       Positioned.directional(
                              //         textDirection: TextDirection.ltr,
                              //         start: 50,
                              //         child:Text(
                              //           'Speed: 5',
                              //           style: TextStyle(
                              //               color: Color(0xFF4D4D4D),
                              //               fontFamily: 'Quicksand'
                              //           ),
                              //         ),
                              //       ),
                              //       Positioned.fill(
                              //         child: SleekCircularSlider(
                              //           initialValue: 8,
                              //           min: 0,
                              //           max: 14,
                              //           appearance: CircularSliderAppearance(
                              //             customWidths: CustomSliderWidths(
                              //               progressBarWidth: 10,
                              //               handlerSize: 3,
                              //             ),
                              //             customColors: CustomSliderColors(
                              //                 trackColor: HexColor('c4c4c4'),
                              //                 progressBarColor: HexColor('00A429'),
                              //                 hideShadow: true,
                              //                 dotColor: HexColor('c4c4c4')),
                              //             startAngle: 90,
                              //             angleRange: 180,
                              //             counterClockwise: true,
                              //           ),
                              //           onChange: (double speed){
                              //           },
                              //           onChangeEnd: (double speed){
                              //           },
                              //         ),
                              //       ),
                              //       Center(
                              //         child: ClipOval(
                              //           child: Material(
                              //             color:HexColor('00A429'),
                              //             child: InkWell(
                              //               splashColor: Colors.black12,
                              //               child: SizedBox(
                              //                 width: 110,
                              //                 height: 110,
                              //                 child: Icon(
                              //                   Icons.keyboard_double_arrow_up_rounded,
                              //                   size: 90,
                              //                   color: Colors.white,),),
                              //               onTap: (){},
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      fallback: (context) => CircularProgressIndicator(),
                    ),
                  ),
                ),
            ),
          );
        },
      ),
    );
  }
}
