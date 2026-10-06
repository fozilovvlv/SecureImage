import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';
import 'features/home/presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedTheme = prefs.getString('theme_mode') ?? 'system';
  final savedLang = prefs.getString('language') ?? 'ru';

  runApp(SecureImageApp(
    initialTheme: savedTheme,
    initialLang: savedLang,
  ));
}

class SecureImageApp extends StatefulWidget {
  final String initialTheme;
  final String initialLang;

  const SecureImageApp({
    super.key,
    required this.initialTheme,
    required this.initialLang,
  });

  static _SecureImageAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_SecureImageAppState>()!;

  @override
  State<SecureImageApp> createState() => _SecureImageAppState();
}

class _SecureImageAppState extends State<SecureImageApp> {
  late ThemeMode _themeMode;
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialTheme == 'dark'
        ? ThemeMode.dark
        : (widget.initialTheme == 'light' ? ThemeMode.light : ThemeMode.system);
    _locale = Locale(widget.initialLang);
  }

  void setThemeMode(ThemeMode mode) async {
    setState(() => _themeMode = mode);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme_mode', mode == ThemeMode.dark ? 'dark' : (mode == ThemeMode.light ? 'light' : 'system'));
  }

  void setLocale(Locale loc) async {
    setState(() => _locale = loc);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', loc.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecureImage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      locale: _locale,
      supportedLocales: const [
        Locale('ru'),
        Locale('uz'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
