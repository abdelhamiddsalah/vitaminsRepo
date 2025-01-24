import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignupLoading, // تحقق من حالة التحميل
                child: SignupViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}
