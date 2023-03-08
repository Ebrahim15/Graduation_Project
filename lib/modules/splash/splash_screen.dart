import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/styles/colors.dart';

class SplashScreen extends StatelessWidget {

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
                    vertical: 300,
                  ),
                  child: Text(
                    "Last published 8 Feb, 2023",
                    style: TextStyle(
                      color: HexColor("#87888F"),
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
