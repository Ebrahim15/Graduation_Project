import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/contact-us/cubit/states.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';

class ContactUsCubit extends Cubit<ContactUsStates>
{
  ContactUsCubit() :super(ContactUsInitialState());

  static ContactUsCubit get (context) => BlocProvider.of(context);

  final TextEditingController controller = TextEditingController();
  final TextEditingController rating = TextEditingController();


  final GlobalKey<FormState> dialogKey = GlobalKey();
  void sendContactUs({required message}){
    emit(SendContactUsState());
    FirebaseFirestore.instance
        .collection('contact')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({
      'contactUs':message,
      'timestamp':FieldValue.serverTimestamp()
    })
        .then((value){
      emit(SendContactUsSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(SendContactUsErrorState(error.toString()));
    });
  }
}