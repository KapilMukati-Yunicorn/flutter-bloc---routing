

import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project1/data/models/login_model.dart';
import 'package:bloc_practice_project1/logic/login/login_event.dart';
import 'package:bloc_practice_project1/logic/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginState()){
    // Save email which is given by user
    on<EmailChange>((event, emit){
      final updateUser = LoginUser(email: event.email, password: state.user?.password ?? "");
      emit(state.copyWith(user: updateUser));
    });

    //Save Password
    on<PasswordChange>((event, emit){
      final updateUser = LoginUser(email: state.user?.email ?? "", password: event.password);
      emit(state.copyWith(user: updateUser));
    });

    on<LoginSubmit>((event, emit) async{
      emit(state.copyWith(isFailure: false, isSubmitting: true, isSuccess: false));
      try {
         await Future.delayed(Duration(seconds: 2));
         emit(state.copyWith(isFailure: false, isSubmitting: false, isSuccess: true));

      }catch(onError){
        emit(state.copyWith(isFailure: true, isSubmitting: false, isSuccess: false));
      };
    });

  }
}
