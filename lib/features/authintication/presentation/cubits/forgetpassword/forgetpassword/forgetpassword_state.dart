part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetpasswordSuccess extends ForgetpasswordState {}

final class ForgetpasswordError extends ForgetpasswordState {
  final String message;
  ForgetpasswordError({required this.message});
}

final class ForgetpasswordLoading extends ForgetpasswordState {}