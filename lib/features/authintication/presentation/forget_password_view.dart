import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/domain/usecases/forgetpassword_usecase.dart';
import 'package:vitamins/features/authintication/presentation/cubits/forgetpassword/forgetpassword/forgetpassword_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgetpasswordCubit(sl<ForgetpasswordUsecase>()),
          child: ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
