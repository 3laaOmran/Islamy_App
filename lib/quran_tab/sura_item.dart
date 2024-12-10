import 'package:flutter/material.dart';
import 'package:islami_app/themes/app_colors.dart';

class SuraItem extends StatelessWidget {
  final String suranEnName;
  final String suranArName;
  final int suranNumber;
  final String suranVerses;

  const SuraItem(
      {super.key,
      required this.suranEnName,
      required this.suranArName,
      required this.suranNumber,
      required this.suranVerses});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/sura_number_frame.png'),
            Text(
              '$suranNumber',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(width: 24),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suranEnName,
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$suranVerses verses',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                suranArName,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
