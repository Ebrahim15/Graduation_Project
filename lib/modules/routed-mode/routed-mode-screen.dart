import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../shared/components/components.dart';
import '../control-mode/control-mode-screen.dart';
import '../esp-connection-tutorial/cubit/cubit.dart';
import '../esp-connection-tutorial/cubit/states.dart';

class RoutedModeScreen extends StatelessWidget {
  var xController = TextEditingController();
  var yController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EspCubit()..getData(),
      child: BlocConsumer<EspCubit, EspStates>(
        listener: (context, state) {},
        builder: (context, state) {
          EspCubit cubit = EspCubit.get(context);
          // print(cubit.automatedSwitch);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF063C14),
                  size: 30,
                ),
                onPressed: () {
                  navigateRootAndFinish(context, ControlModeScreen());
                },
              ),
              centerTitle: true,
              title: const Text(
                'Route',
                style: TextStyle(color: Color(0xFF4D4D4D)),
              ),
            ),
            body: Center(
              child: ConditionalBuilder(
                condition: state is! GetData,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(70.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Length: 200"),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 15.0, 15.0, 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Width: 200"),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Auto",
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
                                  value: cubit.routedSwitch,
                                  onChanged: (bool x) {
                                    cubit.routedModeSwitch();
                                  },
                                  activeColor: HexColor(defaultColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,20.0,20.0,20.0),
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
                                                    if(!cubit.routedSwitch){
                                                      cubit.soilMoisture(10);
                                                    }
                                                  },
                                                  onCancel: (){
                                                    if(!cubit.routedSwitch){
                                                      cubit.soilMoisture(1);
                                                    };
                                                  },
                                                  child: FloatingActionButton(
                                                    heroTag: "Up",
                                                    elevation: 0.0,
                                                    backgroundColor: cubit.routedSwitch ? Colors.grey : HexColor(defaultColor),
                                                    onPressed: cubit.routedSwitch ? null : () {},
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
                                                    if(!cubit.routedSwitch){
                                                      cubit.soilMoisture(11);
                                                    }
                                                  },
                                                  onCancel: (){
                                                    if(!cubit.routedSwitch){
                                                      cubit.soilMoisture(1);
                                                    }
                                                  },
                                                  child: FloatingActionButton(
                                                    heroTag: "Down",
                                                    elevation: 0.0,
                                                    backgroundColor:cubit.routedSwitch ? Colors.grey : HexColor(defaultColor),
                                                    onPressed: cubit.routedSwitch ? null : () {},
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
                                          alignment: Alignment.centerRight,
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
                              ),
                              SizedBox(
                                height: 50,
                              ),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                fallback: (context) => CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
