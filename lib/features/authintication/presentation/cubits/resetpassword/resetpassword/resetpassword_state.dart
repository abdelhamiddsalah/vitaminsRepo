part of 'resetpassword_cubit.dart';

@immutable
sealed class ResetpasswordState {}

final class ResetpasswordInitial extends ResetpasswordState {}

final class ResetpasswordLoading extends ResetpasswordState {}

final class ResetpasswordError extends ResetpasswordState {
  final String message;
  ResetpasswordError({required this.message});
}

final class ResetpasswordSuccess extends ResetpasswordState {}
