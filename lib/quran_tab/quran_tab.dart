import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/quran_tab/sura_details_screen.dart';
import 'package:islami_app/quran_tab/sura_item.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    super.initState();
    fillSuraList();
    loadLastSura();
  }

  Map<String, int> lastSura = {};
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
                  searchText.isNotEmpty
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            lastSura['index'] != null && lastSura['index'] != -1
                                ? Navigator.pushNamed(
                                    context, SuraDetailsScreen.routeName,
                                    arguments: filteredList[lastSura['index']!])
                                : null;
                          },
                          child: mostRecentWidget()),
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
                      onTap: () async {
                        await saveLastSura(
                            // suraEnName: filteredList[index].suraEnName,
                            // suraArName: filteredList[index].suraArName,
                            // numOfVerses: filteredList[index].suraVerses,
                            index: filteredList[index].index);
                        await loadLastSura();
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
              lastSura['index'] == -1 || lastSura['index'] == null
                  ? const Text(
                      'No Items',
                      style: TextStyles.font24W700BlackColor,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                          filteredList[lastSura['index']!].suraEnName,
                          style: TextStyles.font24W700BlackColor,
                  ),
                  Text(
                          filteredList[lastSura['index']!].suraArName,
                          // lastSura['saveList']?[1] ?? '',
                          style: TextStyles.font24W700BlackColor,
                  ),
                  Text(
                          '${filteredList[lastSura['index']!].suraVerses} Verses',
                          // '${lastSura['saveList']?[2] ?? ''} Verses',
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

  Future<void> saveLastSura(
      {
      // {required String suraEnName,
      // required String suraArName,
      // required String numOfVerses,
      required int index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('suraEnName', suraEnName);
    // await prefs.setString('suraArName', suraArName);
    // await prefs.setString('numOfVerses', numOfVerses);
    // await prefs.setStringList('saveList', <String>[suraEnName,suraArName,numOfVerses]);
    await prefs.setInt('index', index);
    // await loadLastSura();
  }

  Future<Map<String, int>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      // 'saveList' : prefs.getStringList('saveList'),
      // 'suraEnName': prefs.getString('suraEnName') ?? '',
      // 'suraArName': prefs.getString('suraArName') ?? '',
      // 'numOfVerses': prefs.getString('numOfVerses') ?? '',
      'index': prefs.getInt('index') ?? -1,
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
