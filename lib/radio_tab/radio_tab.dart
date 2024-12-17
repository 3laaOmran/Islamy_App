import 'package:flutter/material.dart';
import 'package:islami_app/radio_tab/tab_bar_widget.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/images/islami_logo.png'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.halfBlack,
            ),
            child: TabBar(
                unselectedLabelColor: AppColors.whiteColor,
                labelColor: AppColors.blackColor,
                dividerColor: AppColors.transparent,
                labelPadding: const EdgeInsets.symmetric(vertical: 10),
                labelStyle: TextStyles.font16W400,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                tabs: const [
                  Text('Radio'),
                  Text('Reciters'),
                ]),
          ),
          const Expanded(
            child: TabBarView(children: [
              TabBarWidget(
                radio: true,
              ),
              TabBarWidget(),
            ]),
          )
        ],
      ),
    );
  }
}
