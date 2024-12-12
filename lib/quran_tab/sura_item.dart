import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/styles/text_styles.dart';

class SuraItem extends StatelessWidget {
  final SuraModel suraModel;

  const SuraItem(
      {super.key, required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/sura_number_frame.png'),
            Text(
              '${suraModel.index + 1}',
              style: TextStyles.font15W700WhiteColor,
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
                    suraModel.suraEnName,
                    style: TextStyles.font20W700WhiteColor,
                  ),
                  Text(
                    '${suraModel.suraVerses} verses',
                    style: TextStyles.font14W700WhiteColor,
                  ),
                ],
              ),
              Text(
                suraModel.suraArName,
                style: TextStyles.font20W700WhiteColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
