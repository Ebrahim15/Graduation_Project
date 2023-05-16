import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/change_password_screen/cubit/states.dart';
//import 'package:graduation_project/modules/registration/cubit/states.dart';

import '../../../layout/app_layout/app_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';


class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  void userChangePassword({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(ChangePasswordLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password
    )
        .then((value){
      print(value.credential);
      createUser(
          name: name,
          email: email,
          phone: phone,
          uId: value.user?.uid,
      );
    })
        .catchError((error){
      emit(ChangePasswordErrorState(getMessageFromErrorCode(error.code)));
      print(error.toString());
    });
  }

  String getMessageFromErrorCode(error) {
    switch (error) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
      case "too-many-requests":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      default:
        return "Registration failed. Please try again.";
        break;
    }
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String? uId,
  }){
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(ChangePasswordSuccessState(uId));
          emit(CreateUserSuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(CreateUserErrorState(error.toString()));
    });
  }

  void saveChangePasswordData({required String? uId, context}){
    emit(SaveChangePasswordDataLoading());

    CacheHelper.saveData(
      key: 'uId',
      value: uId,
    ).then((value){
      // navigateAndFinish(context, AppLayout());
      emit(SaveChangePasswordDataSuccess());
    }).catchError((error){
      emit(SaveChangePasswordDataError(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined: Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
