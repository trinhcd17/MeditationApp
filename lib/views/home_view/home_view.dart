import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/recommend_models.dart';
import 'package:meditation_app/views/course_view/course_view.dart';
import 'package:meditation_app/views/intro_view/header.dart';
import 'package:meditation_app/views/player_view/binding.dart';
import 'package:meditation_app/views/player_view/player_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenSize.height * 0.05),
          Header(),
          SizedBox(height: screenSize.height * 0.05),
          buildWelcomeText(screenSize),
          buildRecommends(),
          buildDailyThought(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              'Recommended for you',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: kTextPrimaryColor,
                  fontSize: 22),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 16.0,
                ),
                for (var i = 1; i <= 8; i++) buildFooterItem(i),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildFooterItem(int i) {
    var index = i % 2 == 0 ? 1 : 0;
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                color: listRecommend[index].backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                image: DecorationImage(
                    image: AssetImage(listRecommend[index].imageURL),
                    fit: BoxFit.fitWidth)),
          ),
          SizedBox(height: 5.0),
          Text(
            listRecommend[index].title,
            style: TextStyle(
              color: kTextPrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 3.0),
          Text(
            'meditation 3-10 min'.toUpperCase(),
            style: TextStyle(
              color: kTextPrimaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDailyThought() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
            image: AssetImage('assets/images/daily_thought.png'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Thought',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Meditation 3-10 min'.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Get.to(
                    () => PlayerView(
                          title: 'Daily Thought',
                          description: '7 days of calm',
                        ),
                    binding: PlayerViewBinding());
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildRecommends() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildRecommendItem(
            imageURL: 'assets/images/basic_course.png',
            titleText: 'Basics',
            titleText2: 'course',
            backgroundColor: Color.fromRGBO(142, 151, 253, 1),
            textColor: Colors.white,
          ),
          buildRecommendItem(
              imageURL: 'assets/images/relaxing_music.png',
              titleText: 'Relaxation',
              titleText2: 'music',
              backgroundColor: Color.fromRGBO(254, 222, 165, 1),
              textColor: kTextPrimaryColor,
              text2Color: Colors.white),
        ],
      ),
    );
  }

  Container buildRecommendItem({
    String imageURL,
    String titleText,
    String titleText2,
    Color backgroundColor,
    Color textColor,
    Color text2Color,
  }) {
    return Container(
      height: 190,
      width: 160,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Positioned(right: 0, child: Image.asset(imageURL)),
          Positioned(
            bottom: 16.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    '3-10 MIN',
                    style: TextStyle(fontSize: 10, color: textColor),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      Get.to(() => CourseView());
                    },
                    child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: textColor,
                      ),
                      child: Center(
                        child: Text(
                          'Start'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: text2Color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style:
                      TextStyle(fontWeight: FontWeight.w700, color: textColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  titleText2.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    color: textColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildWelcomeText(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: 60,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good morning, Trinh!',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'We wish you have a good day!',
            style: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
