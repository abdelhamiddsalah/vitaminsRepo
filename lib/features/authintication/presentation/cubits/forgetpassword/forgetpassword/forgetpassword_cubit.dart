import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/features/authintication/data/models/forgetpassword_user_params.dart';
import 'package:vitamins/features/authintication/domain/usecases/forgetpassword_usecase.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  final ForgetpasswordUsecase forgetpasswordUsecase;
  ForgetpasswordCubit(this.forgetpasswordUsecase) : super(ForgetpasswordInitial());
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> forgetpassword() async {
  if (!formKey.currentState!.validate()) return;
  emit(ForgetpasswordLoading());
  final params = ForgetpasswordUserParams(
    email: emailController.text,
  );
  final result = await forgetpasswordUsecase.call(param: params);
  
 result.fold(
      (failure) => emit(ForgetpasswordError(message: failure)),
      (success) => emit(ForgetpasswordSuccess()),
    );
}
  }

