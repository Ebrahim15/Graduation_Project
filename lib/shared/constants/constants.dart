
import 'package:graduation_project/modules/login/login_screen.dart';

import '../components/components.dart';
import '../network/local/cache_helper.dart';
import 'package:flutter/material.dart';

var constUid;

void signOut(context)
{
  CacheHelper.removeData(
    key: 'uId',
  ).then((value)
  {
    if (value)
    {
      navigateRootAndFinish(context, LoginScreen());
    }
  });
}