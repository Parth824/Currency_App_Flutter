import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:currency_app/contorler/allprovider.dart';
import 'package:currency_app/model/allmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
//import 'package:searchbar_animation/searchbar_animation.dart';

class SerchPage extends StatefulWidget {
  const SerchPage({super.key});

  @override
  State<SerchPage> createState() => _SerchPageState();
}

class _SerchPageState extends State<SerchPage> {
  late Future<List?> data;

  List m = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   data = Provider.of<AllProvider>(context,listen: false).getCurrency();
    m = Provider.of<AllProvider>(context,listen: false).allModel.k;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          AnimationSearchBar(
            backIconColor: Colors.black,
            centerTitle: 'Search',
            onChanged: (text) {
              
            },
            searchTextEditingController: TextEditingController(),
            horizontalPadding: 5,
          ),
        ],
      ),
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("${data[index]['code']}"),
                    subtitle: Text("${data[index]['value']}"),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
