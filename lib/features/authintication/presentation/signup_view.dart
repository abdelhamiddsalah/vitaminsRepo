import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:vitamins/features/authintication/presentation/cubits/signup/signupcubit/signup_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (_) => SignupCubit(sl<SignupUsecase>()),
      child: Scaffold(body: SafeArea(child: SignupViewBody())),
    );
  }
}
