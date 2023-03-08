import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:graduation_project/shared/components/components.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d4d4d),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    defaultNavigator(navtext: 'Controls', onPresed: () {}),
                    defaultNavigator(
                        navtext: 'Bluetooth settings', onPresed: () {}),
                    defaultNavigator(
                        navtext: 'Help and support', onPresed: () {}),
                    SizedBox(
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
                          Text(
                            'Dark mood',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.dark_mode_outlined),
                          ),
                        ],
                      ),
                    ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20,top: 10,),
//               child: Row(
// //m+inAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text('Dark mood',
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     onPressed: (){},
//                     icon: Icon(Icons.dark_mode_outlined),
//                   ),
//                 ],
//               ),
//             ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
