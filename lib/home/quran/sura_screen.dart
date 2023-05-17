import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/home/quran/sura_data_class.dart';
import 'package:flutter_application_2/home/quran/verses_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

class SuraScreen extends StatefulWidget {
  static const String routeName = "sura screen";

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);

    SuraDataClass? args =
        (ModalRoute.of(context)?.settings.arguments) as SuraDataClass;

    if (verses.isEmpty) readFile(args.index + 1);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          iconTheme: IconThemeData(
            color: Theme.of(context).accentColor,
          ),
        ),
        body: verses.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: Theme.of(context).primaryColor,
                child: Column(children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "سوره ${args.title}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_circle_filled,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Divider(
                      color: Theme.of(context).accentColor,
                      height: 5,
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: verses.length,
                      itemBuilder: (context, index) =>
                          Card(child: VersesWidget(verses[index], index)),
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          height: 5,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
      ),
    );
  }

  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString("assets/files/$fileIndex.txt");
    List<String> lines = fileContent.trim().split('\n');
    setState(() {
      verses = lines;
    });
  }
}
