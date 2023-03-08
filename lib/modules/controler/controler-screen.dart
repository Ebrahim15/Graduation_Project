import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Grscreen extends StatelessWidget {
  //const GRscreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    void initState() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
    @override
    dispose() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    initState();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF063C14),
              size: 30,
            ) ,
            onPressed:(){
              dispose();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppLayout()),
              );
            } ,
          ) ,
          centerTitle: true,
          title: const Text(
            'Controls',
            style: TextStyle(
              color: Color(0xFF4D4D4D)
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.battery_4_bar_rounded,
                color:  Color(0xFF063C14),
                size: 30,
              ),),
            IconButton(
                onPressed: (){},
                icon: Icon(
                    Icons.settings_remote,
                  color:  Color(0xFF063C14),
                  size: 30,
                ),),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.white,
          child: Icon(Icons.settings,
              color: Color(0xFF063C14),
              size: 25),
          onPressed: (){},
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Color(0xFFD9DBD9),
                          child: Icon(Icons.keyboard_arrow_up_rounded,
                              color: Color(0xFF00A429),
                              size: 50),
                          onPressed: (){},
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Color(0xFFD9DBD9),
                              child: Icon(Icons.keyboard_arrow_left_rounded,
                                  color: Color(0xFF00A429),
                                  size: 50),
                              onPressed: (){},
                            ),
                            SizedBox(
                              width: 55,
                              height:55,
                            ),
                            FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Color(0xFFD9DBD9),
                              child: Icon(Icons.keyboard_arrow_right_rounded,
                                  color: Color(0xFF00A429),
                                  size: 50),
                              onPressed: (){},
                            ),
                          ],),
                        FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Color(0xFFD9DBD9),
                          child: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF00A429),
                              size: 50),
                          onPressed: (){},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 180,
                  child: Stack(
                    children: [
                      Positioned.directional(
                          textDirection: TextDirection.ltr,
                          start: 50,
                          child:Text(
                            'Speed: 5',
                            style: TextStyle(
                                color: Color(0xFF4D4D4D),
                                fontFamily: 'Quicksand'
                            ),
                          ),
                      ),
                      Positioned.fill(
                        child: SleekCircularSlider(
                          initialValue: 8,
                          min: 0,
                          max: 14,
                          appearance: CircularSliderAppearance(
                            customWidths: CustomSliderWidths(
                              progressBarWidth: 10,
                              handlerSize: 3,
                            ),
                            customColors: CustomSliderColors(
                                trackColor: HexColor('c4c4c4'),
                                progressBarColor: HexColor('00A429'),
                                hideShadow: true,
                                dotColor: HexColor('c4c4c4')),
                            startAngle: 90,
                            angleRange: 180,
                            counterClockwise: true,
                          ),
                          onChange: (double speed){
                          },
                          onChangeEnd: (double speed){
                          },
                          ),
                        ),
                      Center(
                        child: ClipOval(
                          child: Material(
                            color:HexColor('00A429'),
                            child: InkWell(
                              splashColor: Colors.black12,
                              child: SizedBox(
                                width: 110,
                                height: 110,
                                child: Icon(
                                    Icons.keyboard_double_arrow_up_rounded,
                                  size: 90,
                                  color: Colors.white,),),
                              onTap: (){},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
