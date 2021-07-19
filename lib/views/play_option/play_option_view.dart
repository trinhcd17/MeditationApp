import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/components/rounded_button.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/models/sleep_category.dart';
import 'package:meditation_app/views/player_view/binding.dart';
import 'package:meditation_app/views/player_view/player_view.dart';
import 'package:meditation_app/views/player_view/player_view_dark.dart';

class PlayOptionView extends StatefulWidget {
  @required
  final String title;
  @required
  final String description;

  const PlayOptionView({Key key, this.title, this.description})
      : super(key: key);
  @override
  _PlayOptionViewState createState() => _PlayOptionViewState();
}

class _PlayOptionViewState extends State<PlayOptionView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: kDarkColor,
              height: screenSize.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.35,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(76, 83, 180, 1),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/play_option.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                    ),
                    buildDescription(screenSize),
                    buildTrackingNumber(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 20.0, bottom: 16.0),
                      child: Text(
                        'Related',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var item in listSleepCategory)
                            InkWell(
                              onTap: () {
                                Get.to(() => PlayOptionView(
                                      title: item.title,
                                      description: '45 min - sleep music',
                                    ));
                              },
                              child: Container(
                                height: 150,
                                margin: EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(item.imageURL),
                                              fit: BoxFit.fitWidth)),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      item.title,
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
                    Center(
                      child: roundedButton(
                          function: () {
                            Get.to(
                                () => PlayerViewDark(
                                    title: widget.title,
                                    description: widget.description),
                                binding: PlayerViewBinding());
                          },
                          text: 'Play',
                          screenSize: screenSize,
                          backgroundColor: kPrimaryColor,
                          textColor: Colors.white),
                    ),
                  ],
                ),
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
              color: Colors.white,
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
              color: Colors.white,
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
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.description.toUpperCase(),
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
