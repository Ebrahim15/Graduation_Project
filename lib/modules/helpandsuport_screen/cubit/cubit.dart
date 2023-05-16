import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:graduation_project/modules/feadback_screen/cubit/states.dart';
import 'package:graduation_project/modules/helpandsuport_screen/cubit/states.dart';

class HelpAndSupportCubit extends Cubit<HelpAndSupportStats>
{
  HelpAndSupportCubit() :super(HelpAndSupportInitialState());

  static HelpAndSupportCubit get (context) => BlocProvider.of(context);

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> dialogKey = GlobalKey();
}