import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:hexcolor/hexcolor.dart';

import '../home/home_screen.dart';
import '../registration/registration_screen.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(errorMessage: state.error, state: ToastStates.ERROR);
          } else if (state is LoginSuccessState) {
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
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(90.0, 70.0, 90.0, 100.0),
                        child: Image(
                          image: AssetImage("assets/images/grass_cutter3.jpeg"),
                          height: 159,
                          width: 239,
                        ),
                      ),
                      defaultTextFormField(
                        textController: emailController,
                        hintText: 'Email',
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
                        textController: passwordController,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        onSubmit: (value) {
                          if (formKey.currentState?.validate() == true) {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Password cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        isPassword: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot your password",
                                style: TextStyle(
                                  color: HexColor("#87888F"),
                                  fontSize: 13,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0),
                                alignment: Alignment.centerLeft,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      // Container(
                      //   width: 155,
                      //   height: 55,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: HexColor("#00A429"),
                      //   ),
                      //   child: MaterialButton(
                      //     onPressed: () {
                      //       if (formKey.currentState?.validate() == true) {
                      //         print("Validated");
                      //       }
                      //     },
                      //     child: Text(
                      //       "Login",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultLogInOutButton(
                          buttonText: 'Login',
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                HexColor("#00A429")),
                          ),
                        ),
                      ),
                      // defaultLogInOutButton(
                      //   buttonText: 'Login',
                      //   onPressed: () {
                      //     if (formKey.currentState?.validate() == true) {
                      //       LoginCubit.get(context).userLogin(
                      //           email: emailController.text,
                      //           password: passwordController.text
                      //       );
                      //     }
                      //   },
                      // ),
                      SizedBox(
                        height: 80.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Don't Have an account?",
                                style: TextStyle(
                                  color: HexColor("#87888F"),
                                  fontSize: 13,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateAndFinish(
                                      context, RegistrationScreen());
                                },
                                child: Text(
                                  "Sign up",
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
