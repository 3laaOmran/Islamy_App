import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/quran_tab/sura_details_screen.dart';
import 'package:islami_app/quran_tab/sura_item.dart';
import 'package:islami_app/styles/text_styles.dart';

import '../themes/app_colors.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void fillSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnName: SuraModel.suraEnNameList[i],
          suraArName: SuraModel.suraArNameList[i],
          suraVerses: SuraModel.suraVersesList[i],
          // fileName: '${i + 1}.txt',
          index: i));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fillSuraList();
  }

  List<SuraModel> filteredList = SuraModel.suraList;
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/islami_logo.png'),
          TextFormField(
            style: TextStyles.font16W700WhiteColor,
            onChanged: (text) {
              searchText = text;
              filteredList = SuraModel.suraList.where((sura) {
                return sura.suraArName.contains(searchText) ||
                    sura.suraEnName
                        .toUpperCase()
                        .contains(searchText.toUpperCase());
              }).toList();
              setState(() {});
            },
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                prefixIcon: const ImageIcon(
                  AssetImage('assets/images/quran.png'),
                  color: AppColors.primaryColor,
                ),
                hintText: 'Sura Name',
                hintStyle: TextStyles.font16W700WhiteColor),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchText.isNotEmpty ? const SizedBox() : mostRecentWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Suras List',
                    style: TextStyles.font16W700WhiteColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SuraDetailsScreen.routeName,
                            arguments: filteredList[index]);
                      },
                      child: SuraItem(suraModel: filteredList[index]),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.whiteColor,
                      thickness: 1,
                      indent: 35,
                      endIndent: 40,
                      height: 20,
                    ),
                    itemCount: filteredList.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mostRecentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyles.font16W700WhiteColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Al-Anbiya',
                    style: TextStyles.font24W700BlackColor,
                  ),
                  Text(
                    'الانبياء',
                    style: TextStyles.font24W700BlackColor,
                  ),
                  Text(
                    '112 Verses',
                    style: TextStyles.font14W700BlackColor,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recent.png'),
            ],
          ),
        ),
      ],
    );
  }
}
