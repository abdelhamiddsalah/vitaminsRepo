import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:vitamins/features/authintication/presentation/cubits/login/logincubit/login_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginCubit(sl<SigninUsecase>()),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final isLoading = state is LoginLoading;
              return ModalProgressHUD(
                inAsyncCall: isLoading, // Show/hide the loading indicator
                child: LoginViewBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}
