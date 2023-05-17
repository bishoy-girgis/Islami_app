import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/provider/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLocal("en");
              },
              child: settingsProvider.currentLocal == "en"
                  ? getSelectedItem(
                      context, AppLocalizations.of(context)!.languageEnglish)
                  : getUnSelectedItem(
                      context, AppLocalizations.of(context)!.languageEnglish)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLocal("ar");
              },
              child: settingsProvider.currentLocal == "en"
                  ? getUnSelectedItem(
                      context, AppLocalizations.of(context)!.languageArabic)
                  : getSelectedItem(
                      context, AppLocalizations.of(context)!.languageArabic))
        ],
      ),
    );
  }

  Widget getSelectedItem(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).accentColor),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }

  Widget getUnSelectedItem(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
