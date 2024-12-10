import 'package:flutter/material.dart';
import 'package:islami_app/quran_tab/sura_item.dart';
import 'package:islami_app/quran_tab/suras_lists.dart';

import '../themes/app_colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/islami_logo.png'),
          TextFormField(
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
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Most Recently',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
            ),
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'الانبياء',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '112 Verses',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/images/most_recent.png'),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Suras List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => SuraItem(
                    suranEnName: englishQuranSuras[index],
                    suranArName: arabicQuranSuras[index],
                    suranNumber: index + 1,
                    suranVerses: suraVerses[index]),
                separatorBuilder: (context, index) => const Divider(
                      color: AppColors.whiteColor,
                      thickness: 1,
                      indent: 35,
                      endIndent: 40,
                      height: 20,
                    ),
                itemCount: suraVerses.length),
          )
        ],
      ),
    );
  }
}
