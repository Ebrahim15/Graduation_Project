import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../shared/components/components.dart';

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

  String errorText = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
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
                    hintText: "Passsword",
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
                      } else {
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
                          onTap: (){
                            setState(() {
                              termsChecked = !termsChecked;
                            });
                          },
                          child: termsChecked ?
                          Icon(
                            Icons.check_circle,
                            color: HexColor("#00A429"),
                            size: 20,
                          )
                              :
                          Icon(
                            Icons.circle_outlined,
                            color: HexColor("#00A429"),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 2, 0, 0),
                            child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I agree with the Terms of Service & Privacy Policy",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      errorText,
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
                  defaultLogInOutButton(
                    buttonText: 'Sign up',
                    onPressed: () {
                      if(formKey.currentState?.validate() == true)
                      {
                        print("Validated");
                      }
                      if(termsChecked == false)
                      {
                        setState(() {
                          errorText = "Terms of service should be accepted";
                        });
                      }
                      else{
                        setState(() {
                          errorText = "";
                        });
                      }
                    },
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
                          Text(
                            "Have an account?",
                            style: TextStyle(
                              color: HexColor("#87888F"),
                              fontSize: 13,
                            ),
                          ),
                          TextButton(
                            onPressed: () {

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
  }
}
