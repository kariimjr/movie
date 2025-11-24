import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.text,
    required this.icon
  });

  final String? text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: context.appColorTheme.secondary
            .withValues(alpha: 0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: context.appColorTheme.primary,
            size: 28,
          ),
          Text(text!),
        ],
      ),
    );
  }
}
