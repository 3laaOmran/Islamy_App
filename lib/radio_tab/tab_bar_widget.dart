import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/radio_tab/radio_item.dart';

class TabBarWidget extends StatelessWidget {
  final bool radio;

  const TabBarWidget({super.key, this.radio = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => RadioItem(
                index: index,
                radio: radio,
              )),
    );
  }
}
