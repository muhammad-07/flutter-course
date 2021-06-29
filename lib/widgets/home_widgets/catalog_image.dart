import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CatalogImage extends StatelessWidget {
  final String img;
  const CatalogImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(img).box.make().p16().w32(context);
  }
}