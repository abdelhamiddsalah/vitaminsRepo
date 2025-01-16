part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupError extends SignupState {
  final String message;
  SignupError({required this.message});
}

final class SignupSuccess extends SignupState {}
