import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';
import 'package:graduation_project/modules/esp-connection-tutorial/esp.dart';

import 'package:graduation_project/modules/home-page/home-layout.dart';
import 'package:graduation_project/modules/lets-get-started/lets_get_started_screen.dart';
import 'package:graduation_project/modules/login/cubit/cubit.dart';
import 'package:graduation_project/modules/login/cubit/states.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/on_boarding/on_boarding_screen.dart';
import 'package:graduation_project/modules/registration/cubit/cubit.dart';
import 'package:graduation_project/modules/registration/registration_screen.dart';
import 'package:graduation_project/modules/splash/splash_screen.dart';

import 'package:graduation_project/shared/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();


  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  bool? isDark = CacheHelper.getData(key: 'isDark');

  constUid = CacheHelper.getData(key:'uId');

  Widget widget;

  if(onBoarding != null){
    if (constUid != null) {
      widget = AppLayout();
    } else {
      widget = LoginScreen();
    }
  }
  else {
    widget = LetsGetStartedScreen();
  }



  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));

}


class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool? isDark;
  MyApp({
    required this.startWidget, required this.isDark
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
              )
            ),
          ),
          home: SplashScreen(startWidget: startWidget,),
        );
  }

}
