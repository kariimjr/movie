
import 'package:flutter/material.dart';
import 'package:movie/modules/Layout/pages/Profile/edit_profile.dart';
import 'package:movie/modules/authentication/pages/create_account_screen.dart';
import 'package:movie/modules/authentication/pages/forget_password.dart';
import 'package:movie/modules/authentication/pages/login_screen.dart';
import 'package:movie/modules/onboarding_screen/pages/intro_screen.dart';
import 'package:movie/modules/splash/pages/splash_screen.dart';

import '../../modules/layout/layout_screen.dart';
import '../../modules/onboarding_screen/pages/onboarding_screen.dart';
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
      case RouteName.Intro:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return IntroScreen();
          },
        );
        case RouteName.Onboarding:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return OnboardingScreen();
          },
        );

      case RouteName.Login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return LoginScreen();
          },
        );
      case RouteName.Forget:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ForgetPassword();
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
      case RouteName.EditProfile:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return EditProfile();
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
