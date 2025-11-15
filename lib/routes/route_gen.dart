
import 'package:flutter/material.dart';
import 'package:movie/modules/Layout/pages/layoutScreen.dart';
import 'package:movie/modules/authentication/pages/createAccountScreen.dart';
import 'package:movie/modules/authentication/pages/loginScreen.dart';
import 'package:movie/modules/splash/pages/splashScreen.dart';

import 'app_routes_name.dart';
//
class RouteGen {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {

      case RouteName.Splash:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Splashscreen();
          },
        );
      case RouteName.Login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return LoginScreen();
          },
        );
      case RouteName.CreateAccount:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CreateAccountScreen();
          },
        );
      case RouteName.Layout:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return LayoutScreen();
          },
        );


      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Splashscreen(),
        );
    }
  }
}
