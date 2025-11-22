import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/theme/app_theme.dart';
import 'package:movie/core/widgets/custom_btn.dart';
import 'package:movie/modules/authentication/manager/authProvider.dart';

import 'package:provider/provider.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondaryColor,
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 67, horizontal: 19),
          child: ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Form(
                  key: authProvider.formKey,
                  child: Column(
                    spacing: 17,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 121,
                        height: 118,
                        fit: BoxFit.contain,
                      ),
                      Spacer(),
                      Column(
                        spacing: 22,
                        children: [
                          TextFormField(
                            controller: authProvider.emailController,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/icons/email.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              hintText: "Email",
                            ),
                          ),
                          TextFormField(
                            obscureText: showPassword,
                            controller: authProvider.passwordController,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/icons/password.svg",
                                  width: 30,
                                  height: 30,
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showPassword = !showPassword;
                                  setState(() {});
                                },
                                icon: showPassword
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                              ),
                              hintText: "Password",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password ?",
                              style: AppTheme.darkTheme.textTheme.bodySmall
                                  ?.copyWith(
                                    fontSize: 15,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),

                      CustomBut(
                        onPressed: () {
                          authProvider.Login(context);
                        },
                        text: "Login",
                        isLoading: authProvider.isLoading,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account ?",
                            style: AppTheme.darkTheme.textTheme.bodySmall
                                ?.copyWith(fontSize: 19),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.CreateAccount,
                              );
                            },
                            child: Text(
                              "Create One",
                              style: AppTheme.darkTheme.textTheme.bodySmall
                                  ?.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            "       OR     ",
                            style: AppTheme.darkTheme.textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 100,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      CustomBut(
                        onPressed: () {
                          authProvider.Login(context);
                        },
                        text: "Login With Google",
                        isLoading: false,
                      ),
                      Spacer(),
                      AnimatedToggleSwitch<String>.rollingByHeight(
                        textDirection: TextDirection.ltr,

                        current: "ar",
                        values: ["en", "ar"],
                        iconList: [
                          Image.asset('assets/icons/USA.png', fit: BoxFit.fill,),
                          Image.asset('assets/icons/EG.png', fit: BoxFit.fill,),
                        ],
                        style: ToggleStyle(
                          indicatorColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          backgroundColor: Colors.transparent,

                        ),
                        borderWidth: 1,
                        indicatorIconScale: 0.9,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
