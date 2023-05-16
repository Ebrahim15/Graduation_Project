import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/profile/profile_screen.dart';
import 'package:graduation_project/modules/registration/cubit/states.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../shared/components/components.dart';
import 'cubit/cubit.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
            navigateAndFinish(context, AppLayout());
          }
          if(state is RegisterErrorState)
            {
              showToast(errorMessage: state.error, state: ToastStates.ERROR);
            }
          if(state is RegisterSuccessState){
            RegisterCubit.get(context).saveRegisterData(uId: state.uId);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d4d4d),
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF063C14),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),
            backgroundColor: Colors.white,
            body: Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 75.0, 0, 0),
                    child: Column(
                      children: [
                        defaultTextFormField(
                          textController: nameController,
                          hintText: 'New Name',
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
                          hintText: "New Email",
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
                        defaultTextFormField(
                          textController: phoneNumberController,
                          hintText: " New Phone Number",
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
                          height: 50.0,
                        ),
                        ConditionalBuilder(
                            condition: state is !RegisterLoadingState,
                            builder: (context) => defaultLogInOutButton(
                              buttonText: 'Confirm',
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
