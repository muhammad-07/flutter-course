import 'package:flutter/material.dart';
import 'package:magfee/models/catalog.dart';
import 'package:magfee/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: 
      Container(
        color: Colors.white,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl2.make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.blue),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  ).wh(100, 40)
                ],
              ).p24(),
      ),
      body: SafeArea(
        bottom: false,        
        child: Column(
          children: [
            Hero(child: 
            Image.network(
              catalog.image,
              // width: 200,
              ),
            tag: Key(catalog.id.toString()),
            ).h32(context),
            Expanded(
              
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: MyTheme.blue,
                  child: Column(
                    children: [
                       catalog.name.text.white.xl4.bold.make(),
            // 5:41
            catalog.desc.text.yellow100.xl.make(),
                    ],
                  ).py64(),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
