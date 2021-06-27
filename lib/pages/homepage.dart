import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magfee/widgets/drawer.dart';
import 'package:magfee/models/catalog.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // Its used to fetch data before BUILD is called so we can pass tO BILD
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["items"];
    // print(productsData);
    //4:32
    // List<Item> list =
    CatalogModel.items =
        List.from(productsData).map<Item>((e) => Item.fromMap(e)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(title: Text("Header")),
        body:
            // Center(child: Container(child: Text("Magfee")),

            // List view
            //     Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            //       ? ListView.builder(
            //           // itemCount: dummyList.length,
            //           itemCount: CatalogModel.items!.length,
            //           itemBuilder: (context, index) => ItemWidget(
            //                 item: CatalogModel.items![index],
            //                 // item: dummyList[index],
            //               ))
            //       : Center(
            //           child: CircularProgressIndicator(),
            //         ),
            // ),

            // Grid View
            Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? GridView.builder(
                  itemCount: CatalogModel.items!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items![index];
                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        clipBehavior: Clip.antiAlias,
                        child: GridTile(
                          child: Image.network(item.image),
                          header: Text(item.name),
                          footer: Text(item.price.toString()),
                        ));
                  },
                )
              // // itemCount: dummyList.length,
              // itemCount: CatalogModel.items!.length,
              // itemBuilder: (context, index) => ItemWidget(
              //       item: CatalogModel.items![index],
              //       // item: dummyList[index],
              //     ))
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer());
  }
}
