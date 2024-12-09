import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_tab/hadeth_tab.dart';
import 'package:islami_app/quran_tab/quran_tab.dart';
import 'package:islami_app/radio_tab/radio_tab.dart';
import 'package:islami_app/sebha_tab/sebha_tab.dart';
import 'package:islami_app/themes/app_colors.dart';
import 'package:islami_app/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<String> backGroundImages = [
  'assets/images/quran_bg.png',
  'assets/images/hadeth_bg.png',
  'assets/images/sebha_bg.png',
  'assets/images/radio_bg.png',
  'assets/images/time_bg.png',
];
List<String> bottomBarImages = [
  'assets/images/quran.png',
  'assets/images/hadeth.png',
  'assets/images/sebha.png',
  'assets/images/radio.png',
  'assets/images/time.png',
];

List<Widget> bottomNavTabs = const [
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  TimeTab(),
];

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backGroundImages[currentIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: bottomNavTabs[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedBottomBarDecoration(index: 0),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: selectedBottomBarDecoration(index: 1),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: selectedBottomBarDecoration(index: 2),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: selectedBottomBarDecoration(index: 3),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: selectedBottomBarDecoration(index: 4),
              label: 'Time',
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedBottomBarDecoration({required int index}) {
    if (currentIndex == index) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.halfBlack,
            borderRadius: BorderRadius.circular(66),
          ),
          child: ImageIcon(
            AssetImage(bottomBarImages[index]),
          ));
    }
    return ImageIcon(AssetImage(bottomBarImages[index]));
  }
}
