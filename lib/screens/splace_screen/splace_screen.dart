import 'package:bloc_practice_project1/core/navigation/navigation_service.dart';
import 'package:bloc_practice_project1/logic/splash/splash_bloc.dart';
import 'package:bloc_practice_project1/logic/splash/splash_event.dart';
import 'package:bloc_practice_project1/logic/splash/splash_state.dart';
import 'package:bloc_practice_project1/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => SplashBloc()..add(SplashStarted()),
      child: Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) => {
            if (state is SplashLoading)
              {CircularProgressIndicator()}
            else if (state is SplashFinish)
              {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // ),

                // without navigator service
                // Navigator.pushReplacementNamed(context, AppRoutes.login),

                   NavigationService.pushNamed(AppRoutes.login),
              },
          },
          child: BlocSelector<SplashBloc, SplashState, bool>(
            selector: (state) => state is SplashLoading,
            builder: (context, isLoading) {
              return Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Icon(Icons.reddit, size: 100),
              );
            },
          ),
          // BlocBuilder<SplashBloc, SplashState>(
          //   builder: (context, state) {
          //     return Center(
          //       child: state is SplashLoading
          //           ? CircularProgressIndicator()
          //           : Icon(Icons.reddit, size: 100),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
