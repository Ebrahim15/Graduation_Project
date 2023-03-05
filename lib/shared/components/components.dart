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
Widget profileItem({
    required String itemName,
    required String itemcontent,
})=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      itemName,
      style: TextStyle(
        fontWeight:FontWeight.bold,
        color: Color(0xFF87888f),
      ),
    ),
    Text(
      itemcontent,
      style: TextStyle(
        fontSize:20 ,
        color: Colors.black,
      ),
    ),
    Container(
      width: 250,
      height: 1.0,
      color:Color(0xFFcacdcb),
    ),
  ],
);

Widget defaultNavigator({
  required String navtext,
  required VoidCallback onPresed,
})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(navtext,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
      ),
      Spacer(),
      IconButton(
        onPressed: onPresed,
        icon: Icon(Icons.arrow_forward_ios),
      ),
    ],
  ),
);

Widget defaultLogInOutButton({
  required String buttonText,
  required VoidCallback? onPressed,
  double? wid=155,
  double? high=55,
}) => Container(
      width: wid,
      height: high,
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

