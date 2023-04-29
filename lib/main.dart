import 'package:currency_app/contorler/allprovider.dart';
import 'package:currency_app/contorler/currencyprovider.dart';
import 'package:currency_app/contorler/themeprovider.dart';
import 'package:currency_app/view/serch.dart';
import 'package:currency_app/view/spl_pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrecnyProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => AllProvider(),),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          themeMode: (Provider.of<ThemeProvider>(context).themeModel.isdark)?ThemeMode.dark:ThemeMode.light,
          home: SerchPage(),
        );
      },
    );
  }
}
