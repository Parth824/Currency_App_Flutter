import 'dart:convert';

import 'package:currency_app/model/currencymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as ht;

class CurrecnyProvider extends ChangeNotifier {
  CurrencyModel currencyModel = CurrencyModel(result: 1);

  Future<CurrencyModel?> getCurrency({
    String k1 = "INR",
    String k2 = "CAD",
    String am = "0",
  }) async {
    String Base_Current = "$k1";
    String currencies = "$k2";
    String amount = "$am";
    Map curre_apiid = {};

    String ApiLink =
        "https://api.exchangerate.host/convert?from=${Base_Current}&to=${currencies}&amount=$amount";

    ht.Response response = await ht.get(Uri.parse(ApiLink));

    if (response.statusCode == 200) {
      curre_apiid = json.decode(response.body);

      currencyModel.result = curre_apiid['result'];

      return currencyModel;
    }

    notifyListeners();
  }
}
