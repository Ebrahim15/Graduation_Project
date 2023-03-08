import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/states.dart';

import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  late UserModel model;

  void getUserData(){
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId)
        .get()
        .then((value){
          model = UserModel.fromJson(value.data());
          isLoggedOut = false;
          emit(AppGetUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  bool isLoggedOut = false;
  void logOut(){
    CacheHelper.removeData(
      key: 'uId',
    ).then((value)
    {

      emit(LogOutState());
    });
  }
}