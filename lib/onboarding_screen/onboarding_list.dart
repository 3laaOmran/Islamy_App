import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';

List<Widget> pages = [
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/page_one.png'),
      const Text(
        'Welcome To Islmi App',
        style: TextStyles.font24BoldPrimaryColor,
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/page_two.png'),
      const Text(
        'Welcome To Islmi',
        style: TextStyles.font24BoldPrimaryColor,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'We Are Very Excited To Have You In Our Community',
          textAlign: TextAlign.center,
          style: TextStyles.font20BoldPrimaryColor,
        ),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/page_three.png'),
      const Text(
        'Reading the Quran',
        style: TextStyles.font24BoldPrimaryColor,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Read, and your Lord is the Most Generous',
          textAlign: TextAlign.center,
          style: TextStyles.font20BoldPrimaryColor,
        ),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/page_four.png'),
      const Text(
        'Bearish',
        style: TextStyles.font24BoldPrimaryColor,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          textAlign: TextAlign.center,
          'Praise the name of your Lord, the Most High',
          style: TextStyles.font20BoldPrimaryColor,
        ),
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/page_five.png'),
      const Text(
        'Holy Quran Radio',
        style: TextStyles.font24BoldPrimaryColor,
      ),
      const Text(
        textAlign: TextAlign.center,
        'You can listen to the Holy Quran Radio through the application for free and easily',
        style: TextStyles.font20BoldPrimaryColor,
      ),
    ],
  ),
];
