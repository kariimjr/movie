import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/modules/onboarding_screen/widget/onboard_content.dart';
import 'package:provider/provider.dart';

import 'onBoarding_provider/view_model.dart';



class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: Consumer<ViewModel>(
        builder: (BuildContext context, viewModel, Widget? child) {
          viewModel.scaffoldKey = scaffoldKey;
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
                          viewModel
                              .onboardingData[viewModel.pageViewIndex]
                              .color,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                PageView.builder(
                  controller: viewModel.pageController,
                  onPageChanged: (index) =>
                      viewModel.onPageChange(index, context),
                  itemCount: viewModel.onboardingLength,
                  itemBuilder: (context, index) {
                    return viewModel.isFirst ? OnboardContent() : SizedBox();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
