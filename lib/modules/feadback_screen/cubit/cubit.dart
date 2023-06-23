import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';

class FeedBackCubit extends Cubit<FeedBackStates>
{
  FeedBackCubit() :super(FeedBackInitialState());

  static FeedBackCubit get (context) => BlocProvider.of(context);

  final TextEditingController controller = TextEditingController();
  final TextEditingController rating = TextEditingController();


  final GlobalKey<FormState> dialogKey = GlobalKey();
  void sendFeedback({required message, required rating}){
    emit(SendFeedBackState());
    FirebaseFirestore.instance
        .collection('feedback')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({
      'feedback':message,
      'rating':rating,
      'timestamp':FieldValue.serverTimestamp()
    })
        .then((value){
      emit(SendFeedBackSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(SendFeedBackErrorState(error.toString()));
    });
  }
}