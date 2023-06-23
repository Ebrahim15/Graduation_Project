
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import 'package:graduation_project/shared/cubit/states.dart';

import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

   UserModel? model;

  void getUserData(){
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(constUid)
        .get()
        .then((value){
          model = UserModel.fromJson(value.data());
          // isLoggedOut = false;
          emit(AppGetUserSuccessState());
    })
        .catchError((error){
          print('Error: ${error.toString()}');
      emit(AppGetUserErrorState(error.toString()));
    });

    DocumentReference reference = FirebaseFirestore.instance.collection('users').doc(constUid);
    reference.snapshots().listen((event) {
      model?.name = event.get('name');
      model?.phone = event.get('phone');
      emit(AppGetUserSuccessState());
    });
  }

  bool isDark = false;

  void changeAppMode(bool? fromShared)
  {
    if(fromShared != null){
      isDark = fromShared;
    }
    else{
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value){
        emit(AppChangeScreenModeState());
      });
    }
  }

  // bool isLoggedOut = false;
  // void logOut(){
  //   CacheHelper.removeData(
  //     key: 'uId',
  //   ).then((value)
  //   {
  //
  //     emit(LogOutState());
  //   });
  // }

  // UserModel? getProfileUserData(){
  //   FirebaseFirestore.instance.collection('users').doc(uId)
  //       .get()
  //       .then((value){
  //     model = UserModel.fromJson(value.data());
  //     emit(AppGetProfileData());
  //   });
  //   return model;
  // }
  void editProfile(
      {required String? name,
        required String? phoneNumber}) {
    emit(EditProfile());
    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .update({
      'name': name,
      'phone': phoneNumber,
    })
        .then((value){
      getUserData();
    })
        .catchError((error){
      print(error.toString());
      emit(EditProfileErrorState(error));
    });
  }
}