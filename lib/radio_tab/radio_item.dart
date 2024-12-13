import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class RadioItem extends StatefulWidget {
  final int index;
  final bool radio;

  const RadioItem({super.key, required this.index, required this.radio});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  int? playedIndex;
  int? favoriteIndex;
  int? mutedIndex;
  List<String> names = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Ahmed Al-trabulsi',
    'Malik shaibat Alhamed'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              widget.radio
                  ? 'Radio ${names[widget.index]}'
                  : names[widget.index],
              style: TextStyles.font20BoldBlackColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(playedIndex == widget.index
                    ? 'assets/images/played_bg.png'
                    : 'assets/images/puse_bg.png'),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (favoriteIndex == widget.index) {
                        favoriteIndex = null;
                      } else {
                        favoriteIndex = widget.index;
                      }
                    });
                  },
                  child: Icon(
                    favoriteIndex == widget.index
                        ? CupertinoIcons.heart_fill
                        : CupertinoIcons.heart,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (playedIndex == widget.index) {
                        playedIndex = null;
                      } else {
                        playedIndex = widget.index;
                      }
                    });
                  },
                  child: Icon(
                    playedIndex == widget.index
                        ? CupertinoIcons.pause_fill
                        : CupertinoIcons.play_arrow_solid,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (mutedIndex == widget.index) {
                        mutedIndex = null;
                      } else {
                        mutedIndex = widget.index;
                      }
                    });
                  },
                  child: Icon(
                    mutedIndex == widget.index
                        ? Icons.volume_mute
                        : Icons.volume_up,
                    size: 40,
                  ),
                ),

                // Icon(CupertinoIcons.heart_fill),
              ],
            ),
          )
        ],
      ),
    );
  }
}
