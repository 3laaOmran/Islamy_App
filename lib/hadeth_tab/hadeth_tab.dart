import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth_tab/hadeth_details_screen.dart';
import 'package:islami_app/models/hadeth_model.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadeth = [];
  @override
  Widget build(BuildContext context) {
    if (hadeth.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Image.asset('assets/images/islami_logo.png'),
        hadeth.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : Expanded(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      enlargeFactor: 0.15,
                      viewportFraction: 0.75,
                      height: MediaQuery.of(context).size.height * 0.65,
                      reverse: true,
                      enlargeCenterPage: true,
                      animateToClosest: true),
                  itemCount: hadeth.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HadethDetailsScreen.routeName,
                        arguments: hadeth[itemIndex],
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/hadeth_content_bg.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  hadeth[itemIndex].title,
                                  style: TextStyles.font24W700BlackColor,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Text(
                                    hadeth[itemIndex].content.join(''),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyles.font16BoldBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }

  void loadHadeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel =
          HadethModel(title: hadethTitle, content: hadethLines);

      hadeth.add(hadethModel);
      setState(() {});
    }
  }
}
