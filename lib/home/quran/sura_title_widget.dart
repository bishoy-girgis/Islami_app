import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/quran/sura_data_class.dart';
import 'package:flutter_application_2/home/quran/sura_screen.dart';

class SuraTitleWidget extends StatelessWidget {
  String title;
  int index;

  SuraTitleWidget(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraScreen.routeName,
            arguments: SuraDataClass(index: index, title: title));
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
