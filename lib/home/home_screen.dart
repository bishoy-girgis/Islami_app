import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/hades/hades_tab.dart';
import 'package:flutter_application_2/home/provider/setting_provider.dart';
import 'package:flutter_application_2/home/quran/quran_tab.dart';
import 'package:flutter_application_2/home/radio/radio_tab.dart';
import 'package:flutter_application_2/home/sebha/sebha_tabbb.dart';
import 'package:flutter_application_2/home/settings/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screensTab = [
    QuranTab(),
    HadesTab(),
    SebhaTabbb(),
    RadioTab(),
    SettingTab()
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.getMainBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
        ),
        body: screensTab[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_quran.png")),
                  label: AppLocalizations.of(context)!.quranIcon,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_ahades.png")),
                  label: AppLocalizations.of(context)!.hadesIcon,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                  label: AppLocalizations.of(context)!.sebhaIcon,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_radio.png")),
                  label: AppLocalizations.of(context)!.radioIcon,
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settingIcon,
                  backgroundColor: Theme.of(context).primaryColor),
            ]),
      ),
    );
  }
}
