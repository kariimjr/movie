import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
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
                    Navigator.pushReplacementNamed(context, RouteName.Intro);
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
