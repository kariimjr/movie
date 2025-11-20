import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/modules/Layout/pages/profile.dart';
import 'package:movie/modules/Layout/pages/search.dart';
import 'package:movie/modules/view_model/view_model.dart';
import 'package:provider/provider.dart';

import 'browse.dart';
import 'home.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: Consumer<ViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            body: provider.screens[provider.navIndex],
            bottomNavigationBar: Container(
              margin: EdgeInsets.all(9),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BottomNavigationBar(
                  onTap: provider.onNavTap,
                  currentIndex: provider.navIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/home.svg"),
                      label: "Home",
                      activeIcon: SvgPicture.asset(
                        "assets/icons/home.svg",
                        colorFilter: ColorFilter.mode(
                          Color(0xffF6BD00),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      label: "Search",
                      activeIcon: SvgPicture.asset(
                        "assets/icons/search.svg",
                        colorFilter: ColorFilter.mode(
                          Color(0xffF6BD00),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/explore.svg"),
                      label: "Explore",
                      activeIcon: SvgPicture.asset(
                        "assets/icons/explore.svg",
                        colorFilter: ColorFilter.mode(
                          Color(0xffF6BD00),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/profile.svg"),
                      label: "Profile",
                      activeIcon: SvgPicture.asset(
                        "assets/icons/profile.svg",
                        colorFilter: ColorFilter.mode(
                          Color(0xffF6BD00),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
