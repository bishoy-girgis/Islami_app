import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/home/hades/hades_data_class.dart';
import 'package:flutter_application_2/home/hades/hades_screen.dart';
import 'package:flutter_application_2/home/hades/hades_title_widget.dart';

class HadesTab extends StatefulWidget {
  @override
  State<HadesTab> createState() => _HadesTabState();
}

class _HadesTabState extends State<HadesTab> {
  List<hadesDataClass> AllHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (AllHadeth.isEmpty) LoadFile();
    return Container(
      child: Column(
        children: [
          Expanded(flex: 3, child: Image.asset("assets/images/hades.png")),
          Divider(
            color: Theme.of(context).accentColor,
            thickness: 1.5,
          ),
          const Text(
            textAlign: TextAlign.center,
            "الأحاديث",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Theme.of(context).accentColor,
            thickness: 1.5,
          ),
          Expanded(
            flex: 5,
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadesScreen.routeName,
                          arguments: AllHadeth[index]);
                    },
                    child: HadesTitleWidget(AllHadeth[index].title)),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Divider(
                        color: Theme.of(context).accentColor,
                        thickness: 0.5,
                      ),
                    ),
                itemCount: AllHadeth.length),
          )
        ],
      ),
    );
  }

  void LoadFile() async {
    List<hadesDataClass> listt = [];

    String Content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> allHadethContent = Content.split("#");
    for (int i = 0; i < allHadethContent.length; i++) {
      List<String> hadethlines = allHadethContent[i].trim().split("\n");
      String title = hadethlines[0];
      hadethlines.removeAt(0);
      String content = hadethlines.join("\n");

      hadesDataClass hadeth = hadesDataClass(title, content);
      listt.add(hadeth);
    }
    AllHadeth = listt;
    setState(() {});
  }
}
