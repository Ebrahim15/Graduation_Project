import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/app_layout/app_layout.dart';

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

  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  uId = CacheHelper.getData(key:'uId');

  Widget widget;

  if(onBoarding != null){
    if (uId != null) {
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
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => AppCubit()..getUserData(),
    ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
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
        },
      ),
    );
  }
}
