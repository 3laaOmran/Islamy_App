import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/quran_tab/aya_content_item.dart';
import 'package:islami_app/styles/text_styles.dart';
import 'package:islami_app/themes/app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadContent(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.suraEnName),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/quran_content_bg.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                args.suraArName,
                style: TextStyles.font24BoldPrimaryColor,
              ),
              Expanded(
                child: verses.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        itemCount: verses.length,
                        itemBuilder: (context, index) => AyaContentItem(
                            content: verses[index], index: index)),
              ),
            ],
          )
        ],
      ),
    );
  }

  loadContent(int index) async {
    String suraContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = suraContent.split('\n');
    setState(() {
      verses = suraLines;
    });
  }
}
