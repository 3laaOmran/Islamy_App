import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  int counter = 0;
  String azkar = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset('assets/images/islami_logo.png'),
        const Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: TextStyles.font36BoldWhiteColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
            ),
            Image.asset('assets/images/sebha_head.png'),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
                turns: turns,
                duration: const Duration(milliseconds: 200),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        turns += 1 / 30;
                        counter++;
                        if (counter > 33 && counter < 66) {
                          azkar = 'الحمد لله';
                        } else if (counter > 66 && counter < 99) {
                          azkar = ' الله اكبر';
                        } else if (counter == 100) {
                          azkar = ' لا اله الا الله';
                        } else if (counter == 101) {
                          azkar = 'سبحان الله';
                          counter = 0;
                        }
                      });
                    },
                    child: Image.asset('assets/images/sebha_body.png'))),
            Column(
              children: [
                Text(
                  azkar,
                  style: TextStyles.font36BoldWhiteColor,
                ),
                Text(
                  '$counter',
                  style: TextStyles.font36BoldWhiteColor,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
