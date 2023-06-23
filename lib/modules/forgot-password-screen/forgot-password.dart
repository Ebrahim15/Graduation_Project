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
import 'cubit/states.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  String confirmPasswordErrorText = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
        listener: (context, state) {
          if (state is SendEmailVerificationSuccessState){
            showToast(errorMessage: "Email sent", state: ToastStates.SUCCESS);
            navigateTo(context, LoginScreen());
          }
          if (state is SendEmailVerificationErrorState){
            showToast(errorMessage: state.error, state: ToastStates.ERROR);
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
                        textController: emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          List<String> mail = [
                            "gmail",
                            "hotmail",
                            "outlook",
                            "yahoo"
                          ];
                          if (value?.isEmpty == true) {
                            return "Email cannot be empty";
                          }
                          else if(
                          value?.substring(value.indexOf("@")+1) != "gmail.com" &&
                              value?.substring(value.indexOf("@")+1) != "yahoo.com" &&
                              value?.substring(value.indexOf("@")+1) != "outlook.com" &&
                              value?.substring(value.indexOf("@")+1) != "hotmail.com"
                          ){
                            showToast(errorMessage: "Email address is invalid.", state: ToastStates.ERROR);
                            return "Invalid email address";
                          }
                          else {
                            print("Email: ${value?.substring(value.indexOf("@")+1)}");
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 18.0,
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
                                  navigateTo(context, LoginScreen());
                                },
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(HexColor("#00A429")),
                              ),)
                          ),
                          SizedBox(width: 20,),
                          ConditionalBuilder(
                              condition: state is !SendEmailVerificationState,
                              builder: (context) => defaultLogInOutButton(
                                wid: 140,
                                buttonText: 'Confirm',
                                onPressed: () {
                                  if (formKey.currentState?.validate() == true) {
                                    ForgotPasswordCubit.get(context).sendVerificationEmail(emailController.text);
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
