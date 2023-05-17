import 'package:flutter/material.dart';

class HadesVersesWidget extends StatelessWidget {
  String content;

  HadesVersesWidget(this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          content,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
        ));
  }
}
