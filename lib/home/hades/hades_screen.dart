import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/hades/hades_data_class.dart';
import 'package:flutter_application_2/home/hades/hades_verses_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

class HadesScreen extends StatelessWidget {
  static const String routeName = "hades screen";

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as hadesDataClass;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackground()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          iconTheme: IconThemeData(
            color: Theme.of(context).accentColor,
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 65),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      args.title,
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).accentColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Divider(
                        color: Theme.of(context).accentColor,
                        thickness: 1.2,
                      ),
                    ),
                    HadesVersesWidget(args.content),
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
