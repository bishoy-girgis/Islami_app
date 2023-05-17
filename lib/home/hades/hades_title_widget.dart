import 'package:flutter/material.dart';

class HadesTitleWidget extends StatelessWidget {
  String title;

  HadesTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
    );
  }
}
