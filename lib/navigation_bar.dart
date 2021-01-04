import 'package:flutter/material.dart';
import 'ocean_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopNavigationBar extends StatefulWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xff0091D2),
          height: 310,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 90),
          child: Center(
            child: AutoSizeText(
              'Contact Us',
              maxLines: 1,
              style: TextStyle(
                fontSize: 70,
                color: Colors.white,
                wordSpacing: 1.8,
                fontFamily: 'Roboto-Light.ttf',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Icon(
            Ocean.o,
            size: 80,
            color: Color(0xffBFD400),
          ),
        ),
        Positioned(
          top: 120,
          left: 80,
          child: Icon(
            Ocean.o,
            size: 80,
            color: Color(0xffF8BE5A),
          ),
        ),
        Positioned(
          top: 180,
          left: 170,
          child: Icon(
            Ocean.line_circleshape,
            size: 100,
            color: Color(0xffFFD444),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Icon(
            Ocean.o,
            size: 80,
            color: Color(0xffBFD400),
          ),
        ),
        Positioned(
          top: 130,
          right: 100,
          child: Icon(
            Ocean.o,
            size: 80,
            color: Color(0xffF8BE5A),
          ),
        ),
        Positioned(
          top: 130,
          right: 1,
          child: Transform.rotate(
            angle: -0.3,
            child: Icon(
              Ocean.a,
              size: 80,
              color: Color(0xff00FFB9),
            ),
          ),
        ),
        Positioned(
          top: 220,
          right: 40,
          child: Transform.rotate(
            angle: -0.3,
            child: Icon(
              Ocean.a,
              size: 80,
              color: Color(0xffFF00FF),
            ),
          ),
        ),
        Positioned(
          top: 180,
          right: 210,
          child: Icon(
            Ocean.line_circleshape,
            size: 100,
            color: Color(0xffFFD444),
          ),
        )
      ],
    );
  }
}
