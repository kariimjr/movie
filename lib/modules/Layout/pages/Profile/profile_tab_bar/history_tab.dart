import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/json/popcorn.json"),
      ),
    );
  }
}
