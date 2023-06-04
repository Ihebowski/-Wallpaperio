import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/provider/app_theme.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: _themeProvider.isDark,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      activeColor: Theme.of(context).primaryColor,
      inactiveThumbColor: Theme.of(context).primaryColor,
    );
  }
}
