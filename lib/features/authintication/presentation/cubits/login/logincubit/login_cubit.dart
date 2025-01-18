import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/features/authintication/data/models/signin_user_params.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SigninUsecase _signinUsecase;
  LoginCubit(this._signinUsecase) : super(LoginInitial());

final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) return;
    emit(LoginLoading());
    final params = SigninUserParams(
      email: emailController.text,
      password: passwordController.text,
    );
    final result = await _signinUsecase.call(param: params);
    result.fold(
      (failure) => emit(LoginError(message: failure)),
      (success) => emit(LoginSuccess()),
    );
  }
}
