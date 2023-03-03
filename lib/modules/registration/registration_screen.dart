import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/home/home_screen.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/registration/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../shared/components/components.dart';
import 'cubit/cubit.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Container(
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 55.0, 0, 0),
                    child: Column(
                      children: [
                        defaultTextFormField(
                          textController: nameController,
                          hintText: 'Name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Name cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        defaultTextFormField(
                          textController: emailController,
                          hintText: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        defaultTextFormField(
                          textController: phoneNumberController,
                          hintText: "Phone Number",
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Phone number cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        defaultTextFormField(
                          textController: addressController,
                          hintText: "Address",
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Address cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        defaultTextFormField(
                          textController: passwordController,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Password cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          isPassword: true,
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
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    termsChecked = !termsChecked;
                                  });
                                },
                                child: termsChecked
                                    ? Icon(
                                        Icons.check_circle,
                                        color: HexColor("#00A429"),
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.circle_outlined,
                                        color: HexColor("#00A429"),
                                        size: 20,
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "I agree with the Terms of Service & Privacy Policy",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Text(
                                        termsErrorText,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        ConditionalBuilder(
                            condition: state is !RegisterLoadingState,
                            builder: (context) => defaultLogInOutButton(
                              buttonText: 'Sign up',
                              onPressed: () {
                                if (formKey.currentState?.validate() == true &&
                                    termsChecked == true) {
                                  RegisterCubit.get(context).userRegister(
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
                        // defaultLogInOutButton(
                        //   buttonText: 'Sign up',
                        //   onPressed: () {
                        //     if (formKey.currentState?.validate() == true &&
                        //         termsChecked == true) {
                        //         RegisterCubit.get(context).userRegister(
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
            ),
          );
        },
      ),
    );
  }
}
