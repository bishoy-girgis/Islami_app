import 'package:flutter/material.dart';

class SebhaTabbb extends StatefulWidget {
  @override
  State<SebhaTabbb> createState() => _SebhaTabbbState();
}

class _SebhaTabbbState extends State<SebhaTabbb> {
  int counter = 0;

  int index = 0;

  List<String> adya = [
    "سبحان الله",
    "الحمدلله",
    "الله و أكبر",
    "لا اله الا الله",
    "لا حول ولا قوه الا بالله"
  ];
  double angleRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/sebha_head.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.scaleDown,
                    height: 70,
                    width: 40,
                  )),
              Expanded(
                flex: 5,
                child: Transform.rotate(
                  angle: angleRotation,
                  child: Image.asset('assets/images/sebha_body.png',
                      alignment: Alignment.topCenter),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 4,
          child: Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              onClicked();
            },
            style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor),
              iconSize: const MaterialStatePropertyAll(30),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 40)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
            ),
            child: Text("$counter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Theme.of(context).primaryColor,
                ))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            // color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).accentColor,
                border: Border.all(color: Theme.of(context).accentColor)),
            child: Text(
              "${adya[index]}",
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: Theme.of(context).accentColor,
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    ));
  }

  onClicked() {
    setState(() {
      angleRotation += 15 / 360;
      if (counter < 10) {
        counter++;
      } else {
        counter = 0;
        if (index < 4) {
          index++;
        } else {
          index = 0;
        }
      }
    });
  }
}
