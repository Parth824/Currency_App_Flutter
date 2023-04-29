import 'dart:async';

import 'package:currency_app/view/homepage.dart';
import 'package:flutter/material.dart';

class sple_scenne extends StatefulWidget {
  const sple_scenne({super.key});

  @override
  State<sple_scenne> createState() => _sple_scenneState();
}

class _sple_scenneState extends State<sple_scenne> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (timer) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/t1.gif"),
          ],
        ),
      ),
    );
  }
}
