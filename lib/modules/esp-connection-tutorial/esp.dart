import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:holding_gesture/holding_gesture.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class EspScreen extends StatefulWidget {
  const EspScreen({Key? key}) : super(key: key);

  @override
  State<EspScreen> createState() => _EspScreenState();
}

class _EspScreenState extends State<EspScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EspCubit()..getData(),
        child: BlocConsumer<EspCubit, EspStates>(
          listener: (context, state) {},
          builder: (context, state) {
            EspCubit cubit = EspCubit.get(context);
            return Scaffold(
              body: Center(
                child: ConditionalBuilder(
                  condition: state is! GetData,
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        cubit.automatedSwitch ? "Auto mode: On" : "Auto mode: Off",
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.autoModeSwitch();
                        },
                        child: Text(
                          cubit.automatedSwitch ? "Off" : "ON",
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        cubit.waterPumpValue ? "Water pump mode: On" : "Water pump mode: Off",
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.waterPumpSwitch();
                        },
                        child: Text(
                          cubit.waterPumpValue ? "Off" : "ON",
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          Text(
                            "The soil moisture reading is:",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${cubit.sensorReading}",
                          ),
                        ],
                      ),
                      HoldDetector(
                        onHold: () {
                          cubit.moveCar(2);
                        },
                        onCancel: (){cubit.moveCar(6);},
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forward",
                          ),
                        ),
                      ),
                      HoldDetector(
                        onHold: () {
                          cubit.moveCar(4);
                        },
                        onCancel: (){cubit.moveCar(6);},
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Right",
                          ),
                        ),
                      ),
                      HoldDetector(
                        onHold: () {
                          cubit.moveCar(5);
                        },
                        onCancel: (){cubit.moveCar(6);},
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Left",
                          ),
                        ),
                      ),
                      HoldDetector(
                        onHold: () {
                          cubit.moveCar(3);
                        },
                        onCancel: (){cubit.moveCar(6);},
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Backward",
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.moveCar(6);
                        },
                        child: Text(
                          "Stop",
                        ),
                      ),
                    ],
                  ),
                  fallback: (context) => CircularProgressIndicator(),
                ),
              ),
            );
          },
        ));
  }
}
