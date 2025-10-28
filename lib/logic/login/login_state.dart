import 'package:bloc_practice_project1/data/models/login_model.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final LoginUser? user;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;

  const LoginState({
    this.user,
    this.isSubmitting,
    this.isSuccess,
    this.isFailure,
  });

  factory LoginState.initial() {
    return LoginState(
      user: LoginUser(email: "", password: ""),
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginState copyWith({
    LoginUser? user,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
      user: user ?? this.user,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    user,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}
