import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultTextFormField({
  required TextEditingController textController,
  required String hintText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
  Function(String value)? onSubmit,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
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
          suffixIcon: suffix != null
              ? IconButton(
            icon: Icon(
              suffix,
            ),
            onPressed: suffixPressed,
          )
              : null,
        ),
        controller: textController,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
      ),
    );

Widget profileItem({
  required String itemName,
  required String itemcontent,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF87888f),
          ),
        ),
        Text(
          itemcontent,
          maxLines: 2,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Container(
          width: 250,
          height: 1.0,
          color: Color(0xFFcacdcb),
        ),
      ],
    );

Widget lineItem({
  double width = 350,
  double height = 1,
}) =>
    Container(
      width: width,
      height: height,
      color: Color(0xFFcacdcb),
    );

Widget defaultNavigator({
  required String navtext,
  required VoidCallback onPresed,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10,),
      child: Row(
//m+inAxisAlignment: MainAxisAlignment.spaceAround,
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

Widget homeCard
    ({
  required String cardMasage,
  required String cardImage,
  required VoidCallback ontap,
  double?  contWid=150,
  double? contHigh=150,
  double?  imgWid=100,
  double? imgHigh=100,
  double? boxSz=10,
}) =>
    Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      elevation: 0.2,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        splashColor: Colors.green.withAlpha(30),
        onTap: ontap,
        child: Container(
          width:150 ,
          height:150 ,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children:[
                Expanded(
                  child: Image(
                    image:AssetImage(cardImage),
                    height: imgHigh,
                    width: imgWid,
                  ),
                ),
                SizedBox(
                  height: boxSz,
                ),
                Text(cardMasage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF00A429),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
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

void navigateTo(context, widget) => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => widget,
),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder: (context) => widget,
),
(route) => false,
);

void showToast({
required String errorMessage,
required ToastStates state
}) => Fluttertoast.showToast(
msg: errorMessage,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor: chooseToastColor(state),
textColor: Colors.white,
fontSize: 16.0
);

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state) {
Color color;

switch (state) {
case ToastStates.SUCCESS:
color = Colors.green;
break;
case ToastStates.ERROR:
color = Colors.red;
break;
case ToastStates.WARNING:
color = Colors.amber;
break;
}

  return color;
}

void navigateRootAndFinish(context, widget) => Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(
    builder: (context) => widget,
  ), (route) => false);

Widget defaultTextButton(
    {required String text, required VoidCallback onPressed}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: HexColor(defaultColor),
        ),
      ),
    );

