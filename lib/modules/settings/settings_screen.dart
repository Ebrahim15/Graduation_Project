import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:graduation_project/modules/esp-connection-tutorial/esp.dart';

import 'package:graduation_project/modules/connection/connection_screen.dart';
import 'package:graduation_project/modules/helpandsuport_screen/helpandsupport_screen.dart';


import 'package:graduation_project/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Colors.white,
            appBar: AppBar(
              // backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: Text(
                'Settings',
                style:Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [

                    lineItem(),
                    // defaultNavigator(navtext: 'Controls', onPresed: () {}, context: context),

                    // defaultNavigator(
                    //
                    //     navtext: 'Bluetooth settings', onPresed: () {
                    //       navigateTo(context, EspScreen());
                    // }, context: context),

                    defaultNavigator(
                        navtext: 'Help and support', onPresed: () { navigateTo(context, HelpAndSupport());}, context: context),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Row(
                        children: [

                          // Text(
                          //   'Dark mode',
                          //   style: Theme.of(context).textTheme.bodyMedium,
                          //   // style: TextStyle(
                          //   //   fontSize: 15.0,
                          //   //   // color: Colors.black,
                          //   // ),
                          //
                          // ),
                          // Spacer(),
                          // IconButton(
                          //   onPressed: () {
                          //     AppCubit.get(context).changeAppMode(null);
                          //   },
                          //   icon: Icon(Icons.dark_mode_outlined),
                          // ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
