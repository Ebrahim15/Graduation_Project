import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(90.0, 90.0, 90.0, 125),
                child: Image(
                  image: AssetImage("assets/images/grass_cutter3.jpeg"),
                  height: 159,
                  width: 239,
                ),
              ),
              Container(
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: HexColor('#00A429'),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: HexColor('#00A429'),
                      ),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: HexColor("#87888F"),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(30, 13, 0, 13),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Container(
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: HexColor('#00A429'),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: HexColor('#00A429'),
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: HexColor("#87888F"),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(30, 13, 0, 13),
                  ),
                ),
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
              Container(
                width: 155,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("#00A429"),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
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
                        onPressed: () {},
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
    );
  }
}
