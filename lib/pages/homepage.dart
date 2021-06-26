import 'package:flutter/material.dart';
import 'package:magfee/widgets/drawer.dart';
import 'package:magfee/models/catalog.dart';
import 'package:magfee/widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(title: Text("Header")),
        body:
            // Center(child: Container(child: Text("Magfee")),
            Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            // itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                // item: CatalogModel.items[index],
                item: dummyList[index],
              );
            },
          ),
        ),
        drawer: MyDrawer());
  }
}
