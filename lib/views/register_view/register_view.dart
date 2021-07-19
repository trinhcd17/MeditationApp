import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/views/login_view/login_view.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/login_background.png'),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: kTextPrimaryColor, width: 0.2),
                    shape: BoxShape.circle),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          buildBody(screenSize),
          Positioned(
            bottom: 15,
            child: Container(
              width: screenSize.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?  '.toUpperCase(),
                      style: TextStyle(color: kTextSecondaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(() => LoginView());
                      },
                      child: Text(
                        'Log in'.toUpperCase(),
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildBody(Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Create your account',
            style: TextStyle(
                color: kTextPrimaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 25),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        buildButtonLogin(screenSize),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        Text(
          'or sign up with email'.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w600, color: kTextSecondaryColor),
        ),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        buildTextFields(screenSize),
        SizedBox(
          height: screenSize.height * 0.05,
        ),
        roundedButton(
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          function: () {},
          text: 'Sign up',
          screenSize: screenSize,
        ),
      ],
    );
  }

  Column buildTextFields(Size screenSize) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 55,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Email address',
              hintStyle: TextStyle(fontWeight: FontWeight.w200),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 55,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(fontWeight: FontWeight.w200),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Column buildButtonLogin(Size screenSize) {
    return Column(
      children: [
        roundedImageButton(
          backgroundColor: kFacebookColor,
          function: () {},
          text: 'Continue with Facebook',
          imageUrl: 'assets/icons/facebook.svg',
          screenSize: screenSize,
          textColor: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        roundedImageButton(
          backgroundColor: Colors.white,
          function: () {},
          text: 'Continue with Google',
          imageUrl: 'assets/icons/google.svg',
          screenSize: screenSize,
          showBorder: true,
          textColor: kTextPrimaryColor,
        ),
      ],
    );
  }
}
