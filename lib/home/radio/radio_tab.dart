import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Image.asset("assets/images/radio.png",
                  alignment: Alignment.center)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "إذاعة القرآن الكريم",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_previous),
                        color: Theme.of(context).accentColor,
                        iconSize: 40)),
                Expanded(
                    child: Expanded(
                        child: Expanded(
                            child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  color: Theme.of(context).accentColor,
                  iconSize: 80,
                )))),
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_next),
                        color: Theme.of(context).accentColor,
                        iconSize: 40)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
