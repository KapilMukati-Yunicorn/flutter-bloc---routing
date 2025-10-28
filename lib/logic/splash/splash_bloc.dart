import 'package:bloc/bloc.dart';
import 'package:bloc_practice_project1/logic/splash/splash_event.dart';
import 'package:bloc_practice_project1/logic/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
  }

  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    emit(SplashLoading());
    print("::::Splash Screen loading :::::");
    await Future.delayed(Duration(seconds: 1));
    emit(SplashFinish());
    print("::::Splash Screen Loaded ::::::::");
  }
}
