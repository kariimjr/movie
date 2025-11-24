import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:movie/core/routes/app_routes_name.dart';
import 'package:movie/modules/onboarding_screen/onBoarding_provider/view_model.dart';

import '../../../core/widgets/custom_btn.dart';
import 'onboarding_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_image1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    const Color(0xff121312),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Find Your Next\nFavorite Movie Here',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'Get access to a huge library of movies\nto suit all tastes. You will surely like it.',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.bodySmall,
                ),
                const SizedBox(height: 24),

                CustomBut(
                  isLoading: false,
                  onPressed: () {
                    ViewModel viewModel = ViewModel();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(showBottomSheet: true),
                      ),
                    );
                  },
                  text: 'Explore Now',
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
