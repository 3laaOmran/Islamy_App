import 'package:flutter/material.dart';
import 'package:islami_app/models/hadeth_model.dart';
import 'package:islami_app/styles/text_styles.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadethDetailsScreen';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/quran_content_bg.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                args.title,
                style: TextStyles.font24BoldPrimaryColor,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Text(
                  args.content.join(''),
                  style: TextStyles.font20BoldPrimaryColor,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
