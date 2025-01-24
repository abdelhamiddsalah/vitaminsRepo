import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:vitamins/features/authintication/data/models/resetpassword_user_params.dart';
import 'package:vitamins/features/authintication/domain/usecases/resetpassword_usecase.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  final ResetpasswordUsecase resetpasswordUsecase;
 final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  ResetpasswordCubit(this.resetpasswordUsecase) : super(ResetpasswordInitial());

  Future<void> resetpassword() async {
    if (!formkey.currentState!.validate()) return;
    emit(ResetpasswordLoading());
    final params= ResetpasswordUserParams(password: passwordController.text);
    var result = await resetpasswordUsecase.call(param: params);
    result.fold(
      (failure) => emit(ResetpasswordError(message: failure)),
      (success) => emit(ResetpasswordSuccess()),);
  }
}
