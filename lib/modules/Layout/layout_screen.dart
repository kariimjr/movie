import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:provider/provider.dart';

import '../onboarding_screen/onBoarding_provider/onboarding_provider.dart';
import 'manager/layout_cubit.dart';
import 'manager/layout_state.dart';




class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(builder: (context, state) {
        var cubit = context.watch<LayoutCubit>();
        return  Scaffold(
          body: cubit.screens[cubit.navIndex],
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(9),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                onTap: cubit.onNavTap,
                currentIndex: cubit.navIndex,
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
      },),
    );
  }
}
