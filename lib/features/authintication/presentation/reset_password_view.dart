import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vitamins/core/di/getit.dart';
import 'package:vitamins/features/authintication/domain/usecases/resetpassword_usecase.dart';
import 'package:vitamins/features/authintication/presentation/cubits/resetpassword/resetpassword/resetpassword_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ResetpasswordCubit(sl<ResetpasswordUsecase>()),
          child: BlocBuilder<ResetpasswordCubit, ResetpasswordState>(
            builder: (context, state) {
              return ModalProgressHUD(          
                inAsyncCall: state is ResetpasswordLoading,
                child: ResetPasswordViewBody());
            },
          ),
        ),
      ),
    );
  }
}
