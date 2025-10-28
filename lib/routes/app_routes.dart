
import 'package:bloc_practice_project1/data/models/login_model.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/splace_screen/splace_screen.dart';

class AppRoutes{
  static const String splash = "/";
  static const String login = '/login';
  static const String home = "/home";
  static const String profile = "/profile";


  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case splash :
         return MaterialPageRoute(builder: (_)=> const SplashScreen());

      case login :
         return MaterialPageRoute(builder: (_)=> const LoginPage());

      case home :
        if(args is LoginUser){

          return MaterialPageRoute(builder: (_)=> HomeScreen(user: args));
        }else {
          return _errorRoute("User data missing from home");
        }

      case profile :
           return MaterialPageRoute(builder: (_)=> const ProfilePage());

      default :
        return _errorRoute("No route defined for  ${settings.name}");
    }
  }

 static MaterialPageRoute _errorRoute(String message){
    return MaterialPageRoute(builder: (_)=> Scaffold(body: Center(child: Text(message),),) );
 }

}