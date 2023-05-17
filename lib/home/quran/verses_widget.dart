import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {
  String vers;
  int index;

  VersesWidget(this.vers, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          "$vers (${index + 1})",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
        ));
  }
}
