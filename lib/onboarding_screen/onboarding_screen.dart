import 'package:flutter/material.dart';
import 'package:islami_app/Home/home_screen.dart';
import 'package:islami_app/onboarding_screen/onboarding_list.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding_screen';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        backgroundColor: AppColors.blackColor,
        title: Image.asset('assets/images/islami_logo.png'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: pageController,
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentIndex != 0
                  ? TextButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text(
                        'Prev',
                        style: TextStyles.font16BoldPrimaryColor,
                      ),
                    )
                  : Container(),
              Row(
                children: List.generate(
                  pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Container(
                      width: currentIndex == index ? 18 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                          color: currentIndex == index
                              ? AppColors.primaryColor
                              : AppColors.grayColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  currentIndex != pages.length - 1
                      ? pageController.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        )
                      : Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                },
                child: Text(
                  currentIndex == pages.length - 1 ? 'Finish' : 'Next',
                  style: TextStyles.font16BoldPrimaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
