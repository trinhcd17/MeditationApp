import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meditation_app/constants/constants.dart';
import 'package:meditation_app/views/player_view/controller.dart';

class PlayerViewDark extends StatefulWidget {
  final String title;
  final String description;

  const PlayerViewDark(
      {Key key, @required this.title, @required this.description})
      : super(key: key);
  @override
  _PlayerViewDarkState createState() => _PlayerViewDarkState();
}

class _PlayerViewDarkState extends State<PlayerViewDark> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final controller = Get.find<PlayerViewController>();
    double maxLength = 2.17;
    double max;
    max = maxLength * 60;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: kDarkColor,
            image: DecorationImage(
                image: AssetImage('assets/images/music_background2.png'),
                fit: BoxFit.fitWidth)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            buildListHeaderButton(),
            Spacer(
              flex: 2,
            ),
            Column(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  widget.description.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kTextSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.07),
                buildPlayButtons(controller, max),
                SizedBox(height: screenSize.height * 0.02),
                buildSlider(max, controller),
              ],
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider(double max, PlayerViewController controller) {
    String second2 = (max % 60).toInt() >= 10
        ? '${(max % 60).toInt()}'
        : '0${(max % 60).toInt()}';
    String minute2 = max ~/ 60 >= 10 ? '${max ~/ 60}' : '0${max ~/ 60}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SliderTheme(
              data: SliderThemeData(
                thumbColor: kPrimaryColor,
                activeTrackColor: Colors.white,
                inactiveTrackColor: kTextSecondaryColor.withOpacity(0.5),
              ),
              child: Obx(
                () => Slider(
                  min: 0,
                  max: max,
                  value: controller.sliderValue.value,
                  onChanged: (double value) {
                    controller.sliderChange(value);
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: GetX<PlayerViewController>(builder: (controller) {
                  String second1 =
                      (controller.sliderValue.value % 60).toInt() >= 10
                          ? '${(controller.sliderValue.value % 60).toInt()}'
                          : '0${(controller.sliderValue.value % 60).toInt()}';
                  String minute1 = controller.sliderValue.value ~/ 60 >= 10
                      ? '${controller.sliderValue.value ~/ 60}'
                      : '0${controller.sliderValue.value ~/ 60}';
                  return Text(
                    '$minute1:$second1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }),
              ),
              Text(
                '$minute2:$second2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildPlayButtons(PlayerViewController controller, double max) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            controller.previous15();
          },
          child: SvgPicture.asset(
            'assets/icons/previous_15s.svg',
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            if (controller.sliderValue.value == max) {
              controller.replay();
            } else if (controller.playing.value == false) {
              controller.play(max);
            } else {
              controller.pause();
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(230, 231, 242, 100),
                shape: BoxShape.circle),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Obx(
                () => Icon(
                  controller.sliderValue.value == max
                      ? Icons.replay
                      : controller.playing.value == true
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                  color: Color.fromRGBO(63, 65, 78, 1),
                  size: 48,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            controller.next15s(max);
          },
          child: SvgPicture.asset(
            'assets/icons/next_15s.svg',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Row buildListHeaderButton() {
    return Row(
      children: [
        buildHeaderButton(
          function: () {
            Get.back();
          },
          backgroundColor: Colors.white,
          iconColor: kTextPrimaryColor,
          icon: Icons.close,
        ),
        Spacer(),
        // buildHeaderButton(
        //   function: () {},
        //   backgroundColor: Colors.black.withOpacity(0.5),
        //   iconColor: Colors.white,
        //   icon: Icons.link,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 20.0),
        //   child: buildHeaderButton(
        //     function: () {},
        //     backgroundColor: Colors.black.withOpacity(0.5),
        //     iconColor: Colors.white,
        //     icon: Icons.download_rounded,
        //   ),
        // ),
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
