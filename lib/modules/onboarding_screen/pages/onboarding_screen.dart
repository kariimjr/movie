import 'package:flutter/material.dart';
import 'package:movie/modules/onboarding_screen/onboarding_provider/onboarding_provider.dart';
import 'package:provider/provider.dart';


class OnboardingScreen extends StatelessWidget {
  final bool showBottomSheet;
  OnboardingScreen({Key? key, this.showBottomSheet = false}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (context, viewModel, child) {
          viewModel.scaffoldKey = scaffoldKey;

          if (showBottomSheet) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              viewModel.openBottomSheet(context);
            });
          }

          return Scaffold(
            key: scaffoldKey,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    viewModel.onboardingData[viewModel.pageViewIndex].images,
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
                          viewModel.onboardingData[viewModel.pageViewIndex].color,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                PageView.builder(
                  controller: viewModel.pageController,
                  onPageChanged: (index) async =>
                  await viewModel.onPageChange(index, context),
                  itemCount: viewModel.onboardingLength,
                  itemBuilder: (context, index) => SizedBox(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
