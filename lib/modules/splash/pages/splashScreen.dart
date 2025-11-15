import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/AppColors/appColors.dart';
import 'package:movie/routes/app_routes_name.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: FadeInUp(
                  duration: Duration(seconds: 2),
                  onFinish: (direction) {
                    Navigator.pushReplacementNamed(context, RouteName.Login);
                  },
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
