import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/provider/setting_provider.dart';
import 'package:flutter_application_2/home/settings/language_widget.dart';
import 'package:flutter_application_2/home/settings/theme_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var settingsprovider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.themeTitle,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottom(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.accentColor,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingsprovider.isDark()
                        ? AppLocalizations.of(context)!.themeDark
                        : AppLocalizations.of(context)!.themeLight,
                    style: theme.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: theme.accentColor,
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            AppLocalizations.of(context)!.languageTitle,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottom(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.accentColor,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    settingsprovider.currentLocal == "en"
                        ? AppLocalizations.of(context)!.languageEnglish
                        : AppLocalizations.of(context)!.languageArabic,
                    style: theme.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: theme.accentColor,
                    size: 28,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showThemeBottom(context) {
    showModalBottomSheet(context: context, builder: (context) => ThemeWidget());
  }

  void showLanguageBottom(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageWidget(),
    );
  }
}
