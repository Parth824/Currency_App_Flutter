import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:currency_app/contorler/allprovider.dart';
import 'package:currency_app/model/allmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../contorler/themeprovider.dart';
//import 'package:searchbar_animation/searchbar_animation.dart';

class SerchPage extends StatefulWidget {
  const SerchPage({super.key});

  @override
  State<SerchPage> createState() => _SerchPageState();
}

class _SerchPageState extends State<SerchPage> {
  List<Map<String, dynamic>>? data;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Provider.of<AllProvider>(context, listen: false).allModel.k;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          AnimationSearchBar(
            backIconColor:
                (Provider.of<ThemeProvider>(context).themeModel.isdark)
                    ? Colors.white
                    : Colors.black,
            centerTitle: 'Search',
            searchIconColor:
                (Provider.of<ThemeProvider>(context).themeModel.isdark)
                    ? Colors.white
                    : Colors.black,
            closeIconColor:
                (Provider.of<ThemeProvider>(context).themeModel.isdark)
                    ? Colors.white
                    : Colors.black,
            centerTitleStyle: TextStyle(
              color: (Provider.of<ThemeProvider>(context).themeModel.isdark)
                  ? Colors.white
                  : Colors.black,
            ),
            searchFieldDecoration:
                (Provider.of<ThemeProvider>(context).themeModel.isdark)
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
            onChanged: (text) {
              setState(() {
                if (text.isEmpty) {
                  data = Provider.of<AllProvider>(context, listen: false)
                      .allModel
                      .k;
                } else {
                  data = Provider.of<AllProvider>(context, listen: false)
                      .allModel
                      .k
                      .where(
                        (element) => element['code'].toLowerCase().contains(
                              text.toLowerCase(),
                            ),
                      )
                      .toList();
                }
              });
            },
            searchTextEditingController: textEditingController,
            horizontalPadding: 5,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${data![index]['code']}"),
              subtitle: Text("${data![index]['value']}"),
            ),
          );
        },
      ),
    );
  }
}
