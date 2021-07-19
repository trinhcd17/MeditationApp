import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/views/choose_topic_view/choose_topic_view.dart';
import 'package:meditation_app/views/intro_view/header.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Positioned(
              bottom: 50,
              child: Container(
                  width: screenSize.width,
                  child: Image.asset('assets/images/background_welcome.png'))),
          Positioned(
              bottom: screenSize.height / 2 * 0.6,
              child: Container(
                  width: screenSize.width,
                  child: Image.asset('assets/images/yoga_welcome.png'))),
          Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Header(
                color: Colors.white,
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                width: screenSize.width * 0.75,
                height: screenSize.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Hi Afsar, Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'to Silent Moon',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Explore the  app, Find some peace of mind to prepare for meditation.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
              roundedButton(
                function: () {
                  Get.to(() => ChooseTopicView());
                },
                text: 'Get started',
                screenSize: screenSize,
                backgroundColor: Colors.white,
                textColor: kTextPrimaryColor,
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
