import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final nameController = TextEditingController();
  SignupCubit() : super(SignupInitial());
}
