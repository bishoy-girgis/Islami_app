import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/provider/setting_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

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
                settingsProvider.changeTheme(ThemeMode.dark);
              },
              child: settingsProvider.isDark()
                  ? getSelectedItem(
                      context, AppLocalizations.of(context)!.themeDark)
                  : getUnSelectedItem(
                      context, AppLocalizations.of(context)!.themeDark)),
          const SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.light);
              },
              child: settingsProvider.isDark()
                  ? getUnSelectedItem(
                      context, AppLocalizations.of(context)!.themeLight)
                  : getSelectedItem(
                      context, AppLocalizations.of(context)!.themeLight))
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
