import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/views/login_view/login_view.dart';
import 'package:meditation_app/views/register_view/register_view.dart';

import 'header.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Background(
            screenSize: screenSize,
          ),
          Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Header(),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              Image.asset(
                'assets/images/intro_image.png',
                width: screenSize.width * 0.7,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                width: screenSize.width * 0.75,
                height: screenSize.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'We are what we do',
                      style: TextStyle(
                        color: kTextPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Thousand of people are using silent moon for smalls meditation',
                      style: TextStyle(
                          color: kTextSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  roundedButton(
                      screenSize: screenSize,
                      function: () {
                        Get.to(() => LoginView());
                      },
                      text: 'Log in'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?  '.toUpperCase(),
                        style: TextStyle(color: kTextSecondaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => RegisterView());
                        },
                        child: Text(
                          'Sign up'.toUpperCase(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Size screenSize;
  const Background({
    Key key,
    this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -55,
      child: Container(
        child: Image.asset(
          'assets/images/intro_frame.png',
          height: screenSize.height * 0.7,
          color: Color.fromRGBO(249, 240, 227, 100),
        ),
      ),
    );
  }
}
