import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magfee/widgets/drawer.dart';
import 'package:magfee/models/catalog.dart';
import 'package:magfee/widgets/home_widgets/catalog_list.dart';
import 'package:magfee/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CatalogHeader(),

                (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                    ? Expanded(child: CatalogList().py(16))
                    : Center(child: CircularProgressIndicator()).expand()

                // if (CatalogModel.items != null &&
                //     CatalogModel.items!.isNotEmpty)
                //   {
                //     CatalogList(),
                //   }
                // else
                //   {
                //     Center(
                //       child: CircularProgressIndicator(),
                //     )
                //   }
              ],
            ),
          ),
        ),
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
        //     Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
        //       ? GridView.builder(
        //           itemCount: CatalogModel.items!.length,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               mainAxisSpacing: 16,
        //               crossAxisSpacing: 16),
        //           itemBuilder: (context, index) {
        //             final item = CatalogModel.items![index];
        //             return Card(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20)),
        //                 clipBehavior: Clip.antiAlias,
        //                 child: GridTile(
        //                   child: Image.network(item.image),
        //                   header: Text(item.name),
        //                   footer: Text(item.price.toString()),
        //                 ));
        //           },
        //         )
        //       // // itemCount: dummyList.length,
        //       // itemCount: CatalogModel.items!.length,
        //       // itemBuilder: (context, index) => ItemWidget(
        //       //       item: CatalogModel.items![index],
        //       //       // item: dummyList[index],
        //       //     ))
        //       : Center(
        //           child: CircularProgressIndicator(),
        //         ),
        // ),
        drawer: MyDrawer());
  }
}

// HEADER
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.blue).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

/* day 17 5:27
// LIST
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalogItem = CatalogModel.items![index];
        return CatalogItem(catalog: catalogItem);
      },
    );
  }
}

// Catalog Item
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(img: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.blue).bold.make(),
            // 5:17
            catalog.desc.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: (){},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyTheme.blue),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                  
                )
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(100).make().p16();
  }
}

class CatalogImage extends StatelessWidget {
  final String img;
  const CatalogImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(img).box.make().p16().w32(context);
  }
}
*/