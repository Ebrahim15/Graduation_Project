import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/change_password_screen/cubit/states.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
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
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, AppLayout());
          }
          if(state is ChangePasswordErrorState)
            {
              showToast(errorMessage: state.error, state: ToastStates.ERROR);
            }
          if(state is ChangePasswordSuccessState){
            ChangePasswordCubit.get(context).saveChangePasswordData(uId: state.uId);
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
                      // defaultTextFormField(
                      //   textController: nameController,
                      //   hintText: 'Name',
                      //   keyboardType: TextInputType.name,
                      //   validator: (value) {
                      //     if (value?.isEmpty == true) {
                      //       return "Name cannot be empty";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 18.0,
                      // ),
                      // defaultTextFormField(
                      //   textController: emailController,
                      //   hintText: "Email",
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     List<String> mail = [
                      //       "gmail",
                      //       "hotmail",
                      //       "outlook",
                      //       "yahoo"
                      //     ];
                      //     if (value?.isEmpty == true) {
                      //       return "Email cannot be empty";
                      //     }
                      //     else if(
                      //         value?.substring(value.indexOf("@")+1) != "gmail.com" &&
                      //         value?.substring(value.indexOf("@")+1) != "yahoo.com" &&
                      //         value?.substring(value.indexOf("@")+1) != "outlook.com" &&
                      //         value?.substring(value.indexOf("@")+1) != "hotmail.com"
                      //     ){
                      //       showToast(errorMessage: "Email address is invalid.", state: ToastStates.ERROR);
                      //       return "Invalid email address";
                      //     }
                      //     else {
                      //       print("Email: ${value?.substring(value.indexOf("@")+1)}");
                      //       return null;
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 18.0,
                      // ),
                      // defaultTextFormField(
                      //   textController: phoneNumberController,
                      //   hintText: "Phone Number",
                      //   keyboardType: TextInputType.phone,
                      //   validator: (value) {
                      //     if (value?.isEmpty == true) {
                      //       return "Phone number cannot be empty";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 18.0,
                      // ),
                      // defaultTextFormField(
                      //   textController: addressController,
                      //   hintText: "Address",
                      //   keyboardType: TextInputType.streetAddress,
                      //   validator: (value) {
                      //     if (value?.isEmpty == true) {
                      //       return "Address cannot be empty";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
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
                            // InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //       termsChecked = !termsChecked;
                            //     });
                            //   },
                            //   child: termsChecked
                            //       ? Icon(
                            //           Icons.check_circle,
                            //           color: HexColor("#00A429"),
                            //           size: 20,
                            //         )
                            //       : Icon(
                            //           Icons.circle_outlined,
                            //           color: HexColor("#00A429"),
                            //           size: 20,
                            //         ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "I agree with the Terms of Service & Privacy Policy",
                            //         style: TextStyle(
                            //           fontSize: 13,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding:
                            //             const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            //         child: Text(
                            //           termsErrorText,
                            //           style: TextStyle(
                            //             color: Colors.red,
                            //             fontSize: 11,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
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
                                  navigateTo(context, LoginScreen());
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
                                  if (formKey.currentState?.validate() == true &&
                                      termsChecked == true) {
                                    ChangePasswordCubit.get(context).userChangePassword(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneNumberController.text,
                                    );
                                  }
                                  if (termsChecked == false) {
                                    setState(() {
                                      termsErrorText =
                                      "Terms of service should be accepted";
                                    });
                                  } else {
                                    setState(() {
                                      termsErrorText = "";
                                    });
                                  }
                                },
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(HexColor("#00A429")),
                              ),)
                          ),
                        ],
                      ),

                      // defaultLogInOutButton(
                      //   buttonText: 'Sign up',
                      //   onPressed: () {
                      //     if (formKey.currentState?.validate() == true &&
                      //         termsChecked == true) {
                      //         ChangePasswordCubit.get(context).userChangePassword(
                      //           name: nameController.text,
                      //           email: emailController.text,
                      //           password: passwordController.text,
                      //           phone: phoneNumberController.text,
                      //         );
                      //     }
                      //     if (termsChecked == false) {
                      //       setState(() {
                      //         termsErrorText =
                      //             "Terms of service should be accepted";
                      //       });
                      //     } else {
                      //       setState(() {
                      //         termsErrorText = "";
                      //       });
                      //     }
                      //   },
                      // ),
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
                              Text(
                                "Have an account?",
                                style: TextStyle(
                                  color: HexColor("#87888F"),
                                  fontSize: 13,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateAndFinish(context, LoginScreen());
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: HexColor("#000000"),
                                    fontSize: 13,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
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
