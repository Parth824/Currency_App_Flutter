import 'dart:convert';

import 'package:currency_app/model/allmodel.dart';
import 'package:currency_app/model/currencymodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as ht;

class AllProvider extends ChangeNotifier {
  AllModel allModel = AllModel(k: []);
  Future<List?> getCurrency() async {
    String ApiLink =
        "https://api.currencyapi.com/v3/latest?apikey=xPzrPzY8MS3ap8dyQr4BpbrOM7nBrPxoosCfbBih&base_currency=INR";

    ht.Response response = await ht.get(Uri.parse(ApiLink));

    if (response.statusCode == 200) {
      Map curre_apiid = json.decode(response.body);

      Map<String, dynamic> k = curre_apiid['data'];
      print(k);

      k.forEach((key, value) {
        allModel.k.add(value);
      });

      return allModel.k;
    }

    notifyListeners();
  }
}
