import 'package:flutter/material.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';

class WelcomeSleepView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sleep_dark.png'),
              fit: BoxFit.fill),
          color: kDarkColor),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.1),
          Container(
            width: screenSize.width * 0.9,
            padding: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to sleep',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Explore the new kind of sleep, It uses sound and visualization to create perfect conditions for refreshing sleep. ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: screenSize.height * 0.08),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/bird.png',
              width: screenSize.width * 0.8,
              alignment: Alignment.centerRight,
            ),
          ),
          Spacer(),
          roundedButton(
              function: () {},
              text: 'Get stated',
              screenSize: screenSize,
              textColor: Colors.white,
              backgroundColor: kPrimaryColor),
          SizedBox(height: screenSize.height * 0.1),
        ],
      ),
    );
  }
}
