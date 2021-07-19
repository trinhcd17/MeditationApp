import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/views/player_view/binding.dart';
import 'package:meditation_app/views/player_view/player_view.dart';

class CourseView extends StatefulWidget {
  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenSize.width,
                    height: 265,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/sun.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                  ),
                  buildDescription(screenSize),
                  buildTrackingNumber(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 20.0),
                    child: Text(
                      'Options',
                      style: TextStyle(
                          color: kTextPrimaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.2),
                      ),
                    ),
                    child: TabBar(
                      indicatorColor: kPrimaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: kTextSecondaryColor,
                      labelColor: kPrimaryColor,
                      tabs: [
                        Tab(
                          child: Text(
                            'male voice'.toUpperCase(),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'female voice'.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      Column(
                        children: [
                          buildAudioItem(
                              title: 'Focus Attention',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Body Scan', description: 'happy morning'),
                          buildAudioItem(
                              title: 'Making Happiness',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Relax time',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Anxiety Release',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Focus Attention',
                              description: 'happy morning'),
                        ],
                      ),
                      Column(
                        children: [
                          buildAudioItem(
                              title: 'Focus Attention',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Body Scan', description: 'happy morning'),
                          buildAudioItem(
                              title: 'Making Happiness',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Relax time',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Anxiety Release',
                              description: 'happy morning'),
                          buildAudioItem(
                              title: 'Focus Attention',
                              description: 'happy morning'),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            buildListButtons(),
          ],
        ),
      ),
    );
  }

  Column buildAudioItem({String title, String description}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                      () => PlayerView(
                            title: title,
                            description: description,
                          ),
                      binding: PlayerViewBinding());
                },
                child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 0.7)),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: kTextSecondaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: kTextPrimaryColor, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '10 min'.toUpperCase(),
                    style: TextStyle(fontSize: 10, color: kTextSecondaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.1,
          height: 0.1,
        ),
      ],
    );
  }

  Padding buildTrackingNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/heart_fill.svg',
            height: 22,
            color: Colors.pink.shade300,
          ),
          Text(
            '   24.234 Favourite',
            style: TextStyle(
              color: kTextSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: 50,
          ),
          SvgPicture.asset(
            'assets/icons/headphone.svg',
            height: 22,
            color: Colors.cyan,
          ),
          Text(
            '   34.234 Listening',
            style: TextStyle(
              color: kTextSecondaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDescription(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.2,
      padding: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Happy morning',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'course'.toUpperCase(),
            style: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Ease the mind into a restful night\' sleep with these deep, amblent tones',
            style: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  Widget buildListButtons() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            buildHeaderButton(
              function: () {
                Get.back();
              },
              backgroundColor: Colors.white,
              iconColor: kTextPrimaryColor,
              icon: Icons.arrow_back_rounded,
            ),
            Spacer(),
            buildHeaderButton(
              function: () {},
              backgroundColor: Colors.black.withOpacity(0.5),
              iconColor: Colors.white,
              icon: Icons.link,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: buildHeaderButton(
                function: () {},
                backgroundColor: Colors.black.withOpacity(0.5),
                iconColor: Colors.white,
                icon: Icons.download_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeaderButton(
      {@required IconData icon,
      @required Color backgroundColor,
      @required Color iconColor,
      @required Function function}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30.0),
      child: InkWell(
        onTap: () {
          function();
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: kTextPrimaryColor, width: 0.2),
              shape: BoxShape.circle),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
