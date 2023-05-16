import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // void initState() {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitUp,
    //     DeviceOrientation.portraitDown,
    //   ]);
    // }
    // @override
    // dispose() {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitUp,
    //     DeviceOrientation.portraitDown,
    //   ]);
    // }
    // initState();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var model = AppCubit.get(context).model;
        return Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            // backgroundColor: Colors.white,
            elevation: 0.00,
            centerTitle:true ,
            title:Text(
              'My Profile',
              style:Theme.of(context).textTheme.bodyLarge,
              // style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.bold,
              //   color: Color(0xFF4d4d4d),
              // ),
            ) ,
          ) ,
          body: ConditionalBuilder(
            condition: AppCubit.get(context).model != null,
            builder: (context) => Column(
              children: [
                lineItem(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${model?.name}',
                                  maxLines: 2,
                                  overflow:TextOverflow.ellipsis ,
                                  style:Theme.of(context).textTheme.bodySmall,

                                ),
                                Text(
                                  '${model?.email}',
                                  maxLines: 1,
                                  overflow:TextOverflow.ellipsis ,
                                  style:Theme.of(context).textTheme.bodySmall,

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultLogInOutButton(
                                    wid: 140,
                                    high: 40,
                                    buttonText: 'Edit Profile',
                                    onPressed: () {  }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Stack(
                      //   alignment: AlignmentDirectional.bottomEnd,
                      //   children: const [
                      //     CircleAvatar(
                      //       radius: 140.0,
                      //       backgroundImage: NetworkImage('https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-1/275071295_662218618161041_2481124221236884396_n.jpg?stp=dst-jpg_p160x160&_nc_cat=102&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=n23x8kiTq3IAX8-l7jX&_nc_ht=scontent.fcai22-1.fna&oh=00_AfAb7gvBY_RxaVOZf7eDDEPTYcmog7YoIV2j0WQz37WrxQ&oe=63974CA9'),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsetsDirectional.only(
                      //         bottom: 3.0,
                      //         end: 3.0,
                      //       ),
                      //       child: CircleAvatar(
                      //         radius: 7.0,
                      //        // backgroundImage: ,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileItem(
                        itemName: 'Name',
                        itemcontent:'${model?.name}',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      profileItem(
                        itemName: 'Email',
                        itemcontent:'${model?.email}',

                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      profileItem(
                        itemName: 'Phone',
                        itemcontent: '${model?.phone}',
                      ),
                      // SizedBox(
                      //   height: 20.0,
                      // ),
                      // profileItem(
                      //     itemName: 'Address',
                      //     itemcontent: 'building-9 , salah_salem ',
                      // ),
                    ],
                  ),
                ),
                Spacer(
                ),
                Column(
                  children: [
                    lineItem(),
                    GestureDetector (
                      onTap: (){
                        // AppCubit.get(context).getProfileUserData();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.key_rounded,
                              size: 35,
                              color:Color(0xFF063c14) ,
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'Change Password',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector (
                      onTap: (){
                        signOut(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              size: 35,
                              color:Color(0xFFaa170d) ,
                            ),
                            SizedBox(width: 20,),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                  fontSize: 18
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  HexColor("#00A429")),
            ),),
          ),
          // body:,
        );
      },
    );
  }
}