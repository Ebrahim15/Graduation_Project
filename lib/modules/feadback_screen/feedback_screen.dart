import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import '../../layout/app_layout/app_layout.dart';
import '../../shared/components/components.dart';

class FeedBack extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => FeedBackCubit(),
      child: BlocConsumer<FeedBackCubit, FeedBackStats>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: const Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4d4d4d),
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF063C14),
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppLayout()),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lineItem(
                      width: 300.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      ' Rate your experience',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '  Are you Satisfied With our service ?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    lineItem(width: 300),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Tell us we can improve ?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: SizedBox(
                        width: 350,
                        height: 350,
                        child: TextFormField(

                          controller: FeedBackCubit.get(context).controller,
                          key: FeedBackCubit.get(context).dialogKey,
                          maxLines: 6,
                          maxLength: 200,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff8CEA78),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.grey),
                            ),
                            // contentPadding: EdgeInsets.symmetric(vertical: 400.0),
                            border: OutlineInputBorder(),
                            hintText: 'what\'s on your mind ',
                          ),
                          validator: (String? text)
                          {
                            if(text==null||text.isEmpty)
                            {
                              return'Please enter a value';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    defaultLogInOutButton(
                      buttonText: 'submit',
                      onPressed: () async {
                        print(FeedBackCubit.get(context).controller.text);
                        if (FeedBackCubit.get(context)
                            .dialogKey
                            .currentState!
                            .validate()) {
                          String massage;
                          try {
                            final collection = FirebaseFirestore.instance
                                .collection('database');
                            await collection.doc().set({
                              'timestamp': FieldValue.serverTimestamp(),
                              'feedback':FeedBackCubit.get(context).controller.text,
                            });
                            massage='Feedback sent successfully';
                          } catch (_) {
                            massage = 'Error when sending';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(massage)));
                        }
                      },
                      wid: 350,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
