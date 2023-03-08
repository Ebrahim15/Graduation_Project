import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/on_boarding/on_boarding_screen.dart';
import 'package:graduation_project/shared/components/components.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

class LetsGetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/grass_cutter3.jpeg"),
                  height: 200,
                  width: 300,
                ),
                RichText(
                  text: TextSpan(
                    text: 'AUTOMATED',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' GRASS',
                          style: TextStyle(color: HexColor(defaultColor))),
                      TextSpan(text: ' CUTTER'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 250,
                  ),
                  child: Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor("#00A429"),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        navigateAndFinish(context, OnBoardingScreen());
                      },
                      child: Text(
                        'Lets Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
