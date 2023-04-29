import 'package:currency_app/contorler/currencyprovider.dart';
import 'package:currency_app/contorler/themeprovider.dart';
import 'package:currency_app/model/currencymodel.dart';
import 'package:currency_app/view/serch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<CurrencyModel?> Data;

  String currency_value = "INR";
  List<String> Base_Currency = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTC",
    "BTN",
    "BWP",
    "BYN",
    "BYR",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLF",
    "CLP",
    "CNY",
    "COP",
    "CRC",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DOT",
    "DZD",
    "EGP",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "ETH",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "IMP",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JEP",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LKR",
    "LRD",
    "LSL",
    "LTC",
    "LTL",
    "LVL",
    "LYD",
    "MAD",
    "MATIC",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
  ];
  String currre_Ba = "CAD";
  List<String> currey_va = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTC",
    "BTN",
    "BWP",
    "BYN",
    "BYR",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLF",
    "CLP",
    "CNY",
    "COP",
    "CRC",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DOT",
    "DZD",
    "EGP",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "ETH",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "IMP",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JEP",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LKR",
    "LRD",
    "LSL",
    "LTC",
    "LTL",
    "LVL",
    "LYD",
    "MAD",
    "MATIC",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
  ];
  String bas_curr = "0";
  Widget Base_currency({required String Curre_val}) {
    return DropdownButton(
      value: Curre_val,
      autofocus: true,
      // dropdownColor: Colors.white,
      items: Base_Currency.map(
        (e) => DropdownMenuItem(
          child: Text("$e"),
          value: e,
        ),
      ).toList(),
      onChanged: (value) {
        setState(() {
          currency_value = value!;

          Data = Provider.of<CurrecnyProvider>(context, listen: false)
              .getCurrency(k1: value, k2: currre_Ba, am: bas_curr);
        });
      },
    );
  }

  Widget Base_currency1({required String Curre_val}) {
    return DropdownButton(
      value: Curre_val,
      items: Base_Currency.map(
        (e) => DropdownMenuItem(
          child: Text("$e"),
          value: e,
        ),
      ).toList(),
      onChanged: (value) {
        setState(() {
          currre_Ba = value!;
          Data = Provider.of<CurrecnyProvider>(context, listen: false)
              .getCurrency(k1: currency_value, k2: value, am: bas_curr);
        });
      },
    );
  }

  int i = 0;

  Widget Numberof({required String k}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (k == ".") {
            if (i == 0) {
              bas_curr = bas_curr + k;
              i = 1;
            }
          } else {
            if (bas_curr == "0") {
              bas_curr = k;
            } else {
              bas_curr = bas_curr + k;
            }
          }
        });
        Data = Provider.of<CurrecnyProvider>(context, listen: false)
            .getCurrency(k1: currency_value, k2: currre_Ba, am: bas_curr);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.amber,
        ),
        child: Center(
            child: Text(
          "$k",
          style: TextStyle(
            fontSize: 25,
          ),
        )),
      ),
    );
  }

  Widget caln_ac({required String k}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (k == "AC") {
            bas_curr = "0";
            i = 0;
          } else if (k == "⌫") {
            bas_curr = bas_curr.substring(0, bas_curr.length - 1);
            if (bas_curr == "") {
              bas_curr = "0";
            }
          }

          Data = Provider.of<CurrecnyProvider>(context, listen: false)
              .getCurrency(k1: currency_value, k2: currre_Ba, am: bas_curr);
        });
      },
      child: Container(
        height: 150,
        alignment: Alignment.center,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text("$k"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data = Data = Provider.of<CurrecnyProvider>(context, listen: false)
        .getCurrency(k1: currency_value, k2: currre_Ba, am: bas_curr);
  }

  double itemEx = 60.0;
  int select_item = 0;
  int select_item1 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SerchPage(),
              ),
            );
          },
          child: Icon(Icons.search),
        ),
        actions: [
          Switch(
              value: Provider.of<ThemeProvider>(context).themeModel.isdark,
              onChanged: (val) {
                Provider.of<ThemeProvider>(context, listen: false).setChang();
              }),
        ],
        title: Text(
          "Currency converter",
          style: TextStyle(
            fontSize: 15,
            // color: Colors.black,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Base_currency(Curre_val: currency_value),
                Text(
                  "$bas_curr",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Base_currency1(Curre_val: currre_Ba),
                FutureBuilder(
                  future: Data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return (snapshot.data!.result == null)
                          ? Text(
                              "0",
                              style: TextStyle(fontSize: 22),
                            )
                          : Text(
                              "${snapshot.data!.result}",
                              style: TextStyle(fontSize: 22),
                            );
                    }
                    if (snapshot.hasError) {
                      return Text(
                        "0",
                        style: TextStyle(fontSize: 22),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 130,
            ),
            Divider(
                //color: Colors.black12,
                ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Numberof(k: "7"),
                              Numberof(k: "8"),
                              Numberof(k: "9"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Numberof(k: "4"),
                              Numberof(k: "5"),
                              Numberof(k: "6"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Numberof(k: "1"),
                              Numberof(k: "2"),
                              Numberof(k: "3"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Numberof(k: "0"),
                              Numberof(k: "."),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          caln_ac(k: "AC"),
                          caln_ac(k: "⌫"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
