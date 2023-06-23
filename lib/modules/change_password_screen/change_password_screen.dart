import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/change_password_screen/cubit/states.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/profile/profile_screen.dart';
//import 'package:graduation_project/modules/registration/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../shared/components/components.dart';
import 'cubit/cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneNumberController = TextEditingController();

  var addressController = TextEditingController();

  bool termsChecked = false;

  String termsErrorText = "";
  String confirmPasswordErrorText = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState){
            showToast(errorMessage: "Password changed successfully", state: ToastStates.SUCCESS);
          }
          if (state is ChangePasswordErrorState){
            showToast(errorMessage: "Error changing password", state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: double.infinity,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 75.0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(
                        height: 18.0,
                      ),
                      defaultTextFormField(
                        textController: passwordController,
                        hintText: "Password",
                        suffix: ChangePasswordCubit.get(context).suffix,
                        suffixPressed: (){
                          ChangePasswordCubit.get(context).changePasswordVisibility();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Password cannot be empty";
                          }
                          else if(value!.length < 6){
                            return "Password is too short";
                          }
                          else {
                            return null;
                          }
                        },
                        isPassword: ChangePasswordCubit.get(context).isPassword,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      defaultTextFormField(
                        textController: confirmPasswordController,
                        hintText: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Password cannot be empty";
                          }
                          else if(passwordController.text != confirmPasswordController.text){
                            return "Passwords don't match";
                          }
                          else {
                            return null;
                          }
                        },
                        isPassword: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConditionalBuilder(
                              condition: state is !ChangePasswordLoadingState,
                              builder: (context) => defaultLogInOutButton(
                                bColor: const Color(0xffc51a01),
                                wid: 140,
                                buttonText: 'Cancel',
                                onPressed: () {
                                  navigateTo(context, Profile());
                                },
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(HexColor("#00A429")),
                              ),)
                          ),
                          SizedBox(width: 20,),
                          ConditionalBuilder(
                              condition: state is !ChangePasswordLoadingState,
                              builder: (context) => defaultLogInOutButton(
                                wid: 140,
                                buttonText: 'Confirm',
                                onPressed: () {
                                  if (formKey.currentState?.validate() == true) {
                                   ChangePasswordCubit.get(context).changeUserPassword(passwordController.text);
                                   navigateTo(context, Profile());
                                  }
                                },
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(HexColor("#00A429")),
                              ),)
                          ),
                        ],
                      ),


                      SizedBox(
                        height: 70.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ],
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