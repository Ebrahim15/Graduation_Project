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
            child: Scaffold(),
          );
        },
      ),
    );
  }
}
