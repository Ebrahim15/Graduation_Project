import 'package:flutter/material.dart';

abstract class ContactUsStates {}

class ContactUsInitialState extends ContactUsStates{}

class FeedBackChangeState extends ContactUsStates{}

class SendContactUsState extends ContactUsStates {}

class SendContactUsSuccessState extends ContactUsStates {}

class SendContactUsErrorState extends ContactUsStates{
  final String error;

  SendContactUsErrorState(this.error);
}