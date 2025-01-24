// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/core/widgets/success_dialog.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SigninUsecase _signinUsecase;
  LoginCubit(this._signinUsecase) : super(LoginInitial());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginInitial());
  }

  Future<void> loginUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    final params = SigninUserParams(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await _signinUsecase.call(param: params);
    result.fold(
      (failure) {
        emit(LoginError(message: failure));
      },
      (success) {
        emit(LoginSuccess());
        _navigateBasedOnRole(context, success.data['role']);
      },
    );
  }

  void _navigateBasedOnRole(BuildContext context, String role) {
    if (role == 'user') {
      showDialog(
        context: context,
        builder: (context) =>  SuccessDialog(message: 'Welcome User!',onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },),
      );
    } else if (role == 'admin') {
      showDialog(
        context: context,
        builder: (context) =>  SuccessDialog(message: 'Welcome Admin!',onPressed: (){
          Navigator.pushReplacementNamed(context, '/dashboard');
        },),
      );
    } else {
      emit(LoginError(message: 'Invalid role.'));
    }
  }
}
