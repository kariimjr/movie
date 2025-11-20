import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';


class CustomBut extends StatelessWidget {

  final void Function()? onPressed;
  final String text;
  const CustomBut({
    super.key,
    required this.onPressed,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width,
          55, // fixed height
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        backgroundColor: Color(0xffF6BD00),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: context.appColorTheme.secondary,
          ),
        ),
      ),
    );
  }
}