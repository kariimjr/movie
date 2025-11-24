import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';

class CustomBut extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  bool isLoading;
  bool isBack;
  CustomBut({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = true,
    this.isBack = false,
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
          side: BorderSide(color: context.appColorTheme.primary,width: 2),
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        backgroundColor: isBack
            ? context.appColorTheme.surface
            : context.appColorTheme.primary,
      ),
      onPressed: onPressed,
      child: Center(
        child: AnimatedCrossFade(
          firstChild: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: isBack
                            ? context.appColorTheme.primary
                            : context.appColorTheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          secondChild: CupertinoActivityIndicator(
            color: context.appColorTheme.secondary,
          ),
          crossFadeState: isLoading
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
