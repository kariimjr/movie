import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/constants/profileAvatar.dart';

import 'package:movie/modules/authentication/manager/authService.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../manager/authProvider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool showPassword=true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 40,horizontal: 16),
        child: ChangeNotifierProvider(
          create: (context) => AuthProvider(),
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Form(
                key: authProvider.formKey,
                child: Column(
                  spacing: 15,
                  children: [
                    CarouselSlider.builder(
                      carouselController: CarouselSliderController(),
                      itemCount: AvatarData.Avtar.length,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                          SizedBox(
                            width: 100,
                            height: 161,
                            child: Image.asset(AvatarData.Avtar[itemIndex].images),
                          ), options: CarouselOptions(

                      aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 2,
                    ),
                    ),
                    TextFormField(
                      controller: authProvider.nameController,

                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Color(0xff282A28),
                        fillColor: Color(0xff282A28),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        prefixIcon: Icon(Icons.person_2_outlined, color: Colors.white),
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
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
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: showPassword,

                      controller: authProvider.passwordController,

                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Color(0xff282A28),
                        fillColor: Color(0xff282A28),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        prefixIcon: Icon(Icons.lock_open, color: Colors.white),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: showPassword,

                      controller: authProvider.rePasswordController,
                      validator: (value){
                        if(authProvider.rePasswordController.text != authProvider.passwordController.text){
                          return "Password is not matching";
                        }else {
                          return null;
                        }
                      },
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Color(0xff282A28),
                        fillColor: Color(0xff282A28),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        prefixIcon: Icon(Icons.lock_open, color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            showPassword =! showPassword;
                            setState(() {
                            });
                          },
                          icon: showPassword ? Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          ):Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: authProvider.phoneController,

                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        focusColor: Color(0xff282A28),
                        fillColor: Color(0xff282A28),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        prefixIcon: Icon(Icons.phone_outlined, color: Colors.white),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Color(0xff282A28)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {

                        authProvider.CreateAcc(context);

                      },
                      color: AppColors.primaryColor,
                      minimumSize: Size(double.infinity, 50),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),




                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
