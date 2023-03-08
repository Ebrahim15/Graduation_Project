import 'package:flutter/cupertino.dart';

class UserModel
{
  late String name;
  late String email;
  late String phone;
  late String? uId;
  late bool isEmailVerified;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uId,
    required this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic>? json)
  {
    email = json?['email'];
    name = json?['name'];
    phone = json?['phone'];
    uId = json?['uId'];
    isEmailVerified = json?['isEmailVerified'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uId':uId,
      'isEmailVerified':isEmailVerified,
    };
  }
}