import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';

import '../themes/app_colors.dart';

class AyaContentItem extends StatefulWidget {
  final String content;
  final int index;

  const AyaContentItem({super.key, required this.content, required this.index});

  @override
  State<AyaContentItem> createState() => _AyaContentItemState();
}

class _AyaContentItemState extends State<AyaContentItem> {
  int? selectedAyaIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (selectedAyaIndex == widget.index) {
            selectedAyaIndex = null;
          } else {
            selectedAyaIndex = widget.index;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            color: selectedAyaIndex == widget.index
                ? AppColors.primaryColor
                : AppColors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1,
            )),
        child: Text(
          '${widget.content} [${widget.index + 1}]',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: selectedAyaIndex == widget.index
              ? TextStyles.font20BoldBlackColor
              : TextStyles.font20BoldPrimaryColor,
        ),
      ),
    );
  }
}
