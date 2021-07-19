import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/meditate_category.dart';
import 'package:meditation_app/models/sleep_category.dart';
import 'package:meditation_app/models/topic_models.dart';
import 'package:meditation_app/views/meditate_view/controller.dart';
import 'package:meditation_app/views/play_option/play_option_view.dart';
import 'package:meditation_app/views/player_view/binding.dart';
import 'package:meditation_app/views/player_view/player_view.dart';

class SleepView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MeditateController controller = Get.find<MeditateController>();
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      color: kDarkColor,
      child: Stack(
        children: [
          Positioned(
              top: 0, child: Image.asset('assets/images/sleep_header.png')),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.05),
                buildHeaderText(screenSize),
                SizedBox(height: screenSize.height * 0.05),
                buildListCategory(),
                SizedBox(height: screenSize.height * 0.03),
                buildMainCategory(screenSize),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16.0,
                      ),
                      for (var i = 0; i < 2; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var j = 0; j < 2; j++)
                                InkWell(
                                  onTap: () {
                                    Get.to(() => PlayOptionView(
                                          title: listSleepCategory[j].title,
                                          description: '45 min - sleep music',
                                        ));
                                  },
                                  child: Container(
                                    height: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      listSleepCategory[j]
                                                          .imageURL),
                                                  fit: BoxFit.fitWidth)),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          listSleepCategory[j].title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 3.0),
                                        Text(
                                          '45 min - Sleep music'.toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView buildListCategory() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GetBuilder<MeditateController>(builder: (_) {
        return Row(
          children: [
            SizedBox(
              width: 16.0,
            ),
            for (var i = 0; i < listCategory.length; i++)
              // buildCategoryItem(_, index: i),
              buildCategoryItem(i, _),
          ],
        );
      }),
    );
  }

  Widget buildCategoryItem(int i, MeditateController _) {
    var item = listCategory[i];
    bool selected = _.categoryIndex.value == i ? true : false;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          _.changeIndex(i);
        },
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                  color: selected == true
                      ? kPrimaryColor
                      : Color.fromRGBO(88, 108, 148, 1),
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: SvgPicture.asset(
                item.svgURL,
                color: Colors.white,
              ),
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected == true ? Colors.white : kTextSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderText(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sleep Stories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Smoothing bedtime stories to help you fall into a deep and natural sleep.',
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container buildMainCategory(Size screenSize) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      height: 215,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
            image: AssetImage('assets/images/ocean_moon.png'),
            fit: BoxFit.contain),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The Ocean Moon',
              style: GoogleFonts.lora(
                  color: Color.fromRGBO(255, 231, 191, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 28),
              // TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w700,
              //     fontSize: 26),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Non-stop 8-hour mixes of our most popular sleep audio',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
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
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Center(
                    child: Text(
                      'Start'.toUpperCase(),
                      style: TextStyle(
                          color: kTextPrimaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTopicItem({int index}) {
    var topic = listTopic[index];
    return Container(
      decoration: BoxDecoration(
        color: topic.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Center(
              child: new Image.asset(topic.imageURL),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Text(
                  topic.text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: topic.textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
