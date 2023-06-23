import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/modules/contact-us/cubit/cubit.dart';
import 'package:graduation_project/modules/contact-us/cubit/states.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';
import 'package:graduation_project/modules/helpandsuport_screen/helpandsupport_screen.dart';
import 'package:graduation_project/shared/constants/constants.dart';
import '../../layout/app_layout/app_layout.dart';
import '../../shared/components/components.dart';

class ContactUs extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  // GlobalKey<T> dialogKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => ContactUsCubit(),
      child: BlocConsumer<ContactUsCubit, ContactUsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.00,
              centerTitle: true,
              title: const Text(
                'Contact Us',
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
                  navigateTo(context, HelpAndSupport());
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
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'How can we help you ?',
                      style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: SizedBox(
                        width: 350,
                        height: 350,
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: ContactUsCubit.get(context).controller,
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
                    ),
                    defaultLogInOutButton(
                      buttonText: 'submit',
                      onPressed: ()  {
                        if(formKey.currentState?.validate() == true){
                          String message = '';
                          ContactUsCubit.get(context).sendContactUs(message: ContactUsCubit.get(context).controller.text );
                          if(state is SendContactUsSuccessState){
                            message = "Mail sent successfully";
                          }
                          else if (state is SendContactUsErrorState){
                            message = "Error sending Mail";
                          }
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
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
