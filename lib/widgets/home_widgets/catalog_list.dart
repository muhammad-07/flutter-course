import 'package:flutter/material.dart';
import 'package:magfee/models/catalog.dart';
import 'package:magfee/pages/home_details.dart';
import 'package:magfee/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalogItem = CatalogModel.items![index];
        return InkWell(
          child: CatalogItem(catalog: catalogItem),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetails(
                  catalog: catalogItem,
                ),
              )), // 2nd metgod to redirect using route 1st in login
        );
      },
    );
  }
}

// ITem
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          child: CatalogImage(img: catalog.image),
          tag: Key(catalog.id.toString()),
        ),
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
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.blue),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                )
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().p16();
  }
}
