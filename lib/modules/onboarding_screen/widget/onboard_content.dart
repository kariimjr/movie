import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_btn.dart';
import '../../view_model/view_model.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          Text(
            textAlign: TextAlign.center,
            viewModel.onboardingData[viewModel.pageViewIndex].title,
            style: viewModel.isFirst
                ? context.appTextTheme.bodyLarge
                : context.appTextTheme.bodyMedium,
          ),
          SizedBox(height: 16),
          Text(
            textAlign: TextAlign.center,
            viewModel.onboardingData[viewModel.pageViewIndex].description,
            style: context.appTextTheme.bodySmall,
          ),
          SizedBox(height: 24),
          CustomBut(
            onPressed: () async {
              await viewModel.getNextCard();
              await Future.delayed(Duration(milliseconds: 100));
            },
            text: viewModel.isFirst
                ? 'Explore Now'
                : viewModel.isLast
                ? 'Finish'
                : 'Next',
          ),
          viewModel.pageViewIndex > 1 ? Column(
            children: [
              SizedBox(height: 16,),
              CustomBut(
                onPressed: () async {
                  await viewModel.getPreviousCard();
                },
                text: 'Back',
              ),
            ],
          ): SizedBox(),
          SizedBox(height: 33),
        ],
      ),
    );
  }
}
