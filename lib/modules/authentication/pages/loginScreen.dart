import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/modules/authentication/manager/authProvider.dart';
import 'package:movie/modules/authentication/manager/authService.dart';

import 'package:provider/provider.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    spacing: 10,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 121,
                        height: 118,
                        fit: BoxFit.contain,
                      ),
                      TextFormField(
                        controller: authProvider.emailController,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          focusColor: Color(0xff282A28),
                          fillColor: Color(0xff282A28),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: authProvider.passwordController,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          focusColor: Color(0xff282A28),
                          fillColor: Color(0xff282A28),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: Colors.white,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff282A28),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      CupertinoButton(
                        onPressed: () {
                          authProvider.Login(context);
                        },
                        color: AppColors.primaryColor,
                        minimumSize: Size(double.infinity, 50),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account ?",
                            style: TextStyle(color: Colors.white),
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
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
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
