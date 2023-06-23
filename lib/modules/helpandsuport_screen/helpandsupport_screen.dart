import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/modules/contact-us/contactUs-screen.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';
import 'package:graduation_project/modules/feadback_screen/feedback_screen.dart';
import 'package:graduation_project/modules/helpandsuport_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import '../../layout/app_layout/app_layout.dart';
import '../../shared/components/components.dart';
import 'cubit/states.dart';
import 'package:graduation_project/modules/settings/settings_screen.dart';



class HelpAndSupport extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => HelpAndSupportCubit(),
      child: BlocConsumer<HelpAndSupportCubit, HelpAndSupportStats>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
           // backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: const Text(
                'Help and Support',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF063C14),
                ),
              ),
              // leading: IconButton(
              //   icon: const Icon(
              //     Icons.arrow_back_ios_new_rounded,
              //     color: Color(0xFF063C14),
              //     size: 25,
              //   ),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SettingsScreen()),
              //     );
              //   },
              // ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lineItem(
                      width: 300.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/support-img.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            ' How can we help you ?',
                            style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' It looks like you are experiencing problems with controling or locating your veicle .We are here to help so please get in touch with us',
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              color: Color(0xFF08521C),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30,bottom: 30),
                            child: Row(
                              children: [
                                // homeCard(
                                //     cardMasage: 'Watch demo',
                                //     cardImage:'assets/images/watchdemo1.png',
                                //     ontap: (){}),
                                // SizedBox(
                                //   width: 20,
                                // ),
                                Center(
                                  child: homeCard(
                                      cardMasage: 'Contact us',
                                      cardImage:'assets/images/contactus32.png',
                                      ontap: (){
                                        navigateTo(context,ContactUs());
                                      }),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
