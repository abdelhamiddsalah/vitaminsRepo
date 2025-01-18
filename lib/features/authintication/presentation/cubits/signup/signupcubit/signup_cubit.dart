import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/features/authintication/data/models/signup_user_params.dart';
import 'package:vitamins/features/authintication/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUsecase _signupUsecase;

  SignupCubit(this._signupUsecase) : super(SignupInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String selectedUserType = 'user';

  Future<void> registerUser() async {
    if (!formKey.currentState!.validate()) return;
    emit(SignupLoading());
    final params = SignupUserParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      role: selectedUserType,
    );
    final result = await _signupUsecase.call(param: params);
    result.fold(
      (failure) => emit(SignupError(message: failure)),
      (success) => emit(SignupSuccess()),
    );
  }

  void updateUserType(String userType) {
    selectedUserType = userType;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}
