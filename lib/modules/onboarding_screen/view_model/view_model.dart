import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/modules/Layout/pages/browse.dart';
import 'package:movie/modules/Layout/pages/home.dart';
import 'package:movie/modules/Layout/pages/profile.dart';
import 'package:movie/modules/Layout/pages/search.dart';
import '../../../core/constants/onboarding_data.dart';

import '../widget/onboard_content.dart';

class ViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  PersistentBottomSheetController? bottomSheetController;

  int onboardingLength = OnboardingData.onboardingData.length;
  var onboardingData = OnboardingData.onboardingData;
  GlobalKey<ScaffoldState>? scaffoldKey;

  int navIndex = 0;
  int pageViewIndex = 0;
  bool isFirst = true;
  bool isLast = true;
  List<Widget> screens = [Home(), Search(), Browse(), Profile()];

  void onNavTap(int index) {
    navIndex = index;
    notifyListeners();
  }

  Future<void> onPageChange(int index, BuildContext context) async{
    pageViewIndex = index;
    if (index != 0) await openBottomSheet(context);
    isFirst = (pageViewIndex == 0);
    isLast = (pageViewIndex == onboardingLength - 1);
    notifyListeners();
  }

  Future<void> getNextCard() async {
    if (pageViewIndex < onboardingData.length - 1) {
      await pageController.animateToPage(
        pageViewIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> openBottomSheet(BuildContext context) async {
    if (bottomSheetController != null) {
      bottomSheetController!.close();
    }

    await Future.delayed(const Duration(milliseconds: 300));

    if (scaffoldKey != null) {
      bottomSheetController = scaffoldKey!.currentState!.showBottomSheet(
        (context) => OnboardContent(),
      );
    }
  }

  Future<void> getPreviousCard() async {
    if (pageViewIndex > 0) {
      pageController.animateToPage(
        pageViewIndex - 1,
        duration: Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }
}
