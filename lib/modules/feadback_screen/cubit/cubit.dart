import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';

class FeedBackCubit extends Cubit<FeedBackStats>
{
  FeedBackCubit() :super(FeedBackInitialState());

  static FeedBackCubit get (context) => BlocProvider.of(context);

  final TextEditingController controller = TextEditingController();
  final TextEditingController rating = TextEditingController();


  final GlobalKey<FormState> dialogKey = GlobalKey();
}