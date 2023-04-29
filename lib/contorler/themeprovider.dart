import 'package:currency_app/model/thememodel.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isdark: false);

  setChang() {
    themeModel.isdark = !themeModel.isdark;
    notifyListeners();
  }
}
