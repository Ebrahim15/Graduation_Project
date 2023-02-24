import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultTextFormField({
  required TextEditingController textController,
  required String hintText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  bool isPassword = false,
}) =>
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
          hintText: hintText,
          hintStyle: TextStyle(
            color: HexColor("#87888F"),
          ),
          contentPadding: EdgeInsets.fromLTRB(30, 13, 0, 13),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: HexColor('#00A429'),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: HexColor('#00A429'),
            ),
          ),
        ),
        controller: textController,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: isPassword,
      ),
    );

Widget defaultLogInOutButton({
  required String buttonText,
  required VoidCallback? onPressed,
}) => Container(
      width: 155,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HexColor("#00A429"),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );

