import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/styles/colors.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';

class BoardingModel
{
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/arrows1.png',
      title: "Control your grass cutter",
      body: "controls screen",
    ),
    BoardingModel(
      image: 'assets/images/soil.jpg',
      title: "Check soil readings",
      body: "soil moisture",
    ),
    BoardingModel(
      image: 'assets/images/safety.png',
      title: "Safety !",
      body: "Don't use the product close to children",
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value) {
        navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          defaultTextButton(
            text: "SKIP",
            onPressed: (){
            navigateRootAndFinish(context, LoginScreen(),);
          },)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index){
                  if(index == boarding.length-1){
                    setState(() {
                      isLast = true;
                    });
                  }
                  else{
                    isLast = false;
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children:
              [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: HexColor(defaultColor),
                    dotHeight: 10.0,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: HexColor(defaultColor),
                  onPressed: (){
                    if(isLast){
                      submit();
                    }
                    else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          color: model.title.contains('Safety') ? Colors.red : Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          color: model.title.contains('Safety') ? Colors.red : Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
