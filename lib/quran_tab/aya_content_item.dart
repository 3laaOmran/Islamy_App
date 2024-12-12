import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';

import '../themes/app_colors.dart';

class AyaContentItem extends StatelessWidget {
  final String content;
  final int index;

  const AyaContentItem({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          )),
      child: Text(
        '$content [${index + 1}]',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyles.font20BoldPrimaryColor,
      ),
    );
  }
}
