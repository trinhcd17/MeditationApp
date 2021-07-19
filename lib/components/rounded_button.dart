import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants/constants.dart';

Widget roundedButton({
  @required Function function,
  @required String text,
  @required Size screenSize,
  Color backgroundColor,
  Color textColor,
}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: 50,
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
        ),
      ),
    ),
  );
}

Widget roundedImageButton(
    {Function function,
    String text,
    Size screenSize,
    String imageUrl,
    bool showBorder,
    Color backgroundColor,
    Color textColor}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      width: 330,
      decoration: BoxDecoration(
        border: showBorder == true
            ? Border.all(color: Colors.grey, width: 0.5)
            : null,
        color: backgroundColor == null ? kFacebookColor : backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            imageUrl,
            height: 25,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            text.toUpperCase(),
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

Widget backButton({
  Function function,
}) {
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
            border: Border.all(color: kTextPrimaryColor, width: 0.2),
            shape: BoxShape.circle),
        child: Icon(Icons.arrow_back),
      ),
    ),
  );
}
