import 'package:flutter/material.dart';

abstract class FeedBackStates {}

class FeedBackInitialState extends FeedBackStates{}

class FeedBackChangeState extends FeedBackStates{}

class SendFeedBackState extends FeedBackStates {}

class SendFeedBackSuccessState extends FeedBackStates {}

class SendFeedBackErrorState extends FeedBackStates{
  final String error;

  SendFeedBackErrorState(this.error);
}