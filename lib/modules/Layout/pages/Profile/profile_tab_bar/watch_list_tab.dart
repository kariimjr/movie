import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/json/popcorn.json"),
      ),
    );
  }
}
