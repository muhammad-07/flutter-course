class CatalogModel {
  // static final items = [
  //   Item(
  //       id: 1,
  //       name: "AAA",
  //       desc: "DESC",
  //       color: "#33505a",
  //       price: 20.0,
  //       image:
  //           "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvdjc5MS10YW5nLTM1LnBuZw.png?s=aLxshBxLcykO2UAnr6F0Nzhqtdx6iR6UuKi4bFSTzC8")
  // ];


  //DEFAULT VALUES
  // static List<Item> items = [
  //   Item(
  //       id: 1,
  //       name: "Default",
  //       desc: "DESC",
  //       color: "#33505a",
  //       price: 0.0,
  //       image:
  //           "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvdjc5MS10YW5nLTM1LnBuZw.png?s=aLxshBxLcykO2UAnr6F0Nzhqtdx6iR6UuKi4bFSTzC8")
  // ];
  static List<Item>? items;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

// This constructor is For fetvhing hardcoded data
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.image,
      required this.price});

// This constructor is For fetching Map json data from json file

// to map data we are getting into our class
// factory is used when we have more than one constrs
// Strings means key type and dynamic means value type, that we are receiving from source

//  Commenting to test data dart class generator plugin that auto generats
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      color: map["color"],
      image: map["image"],
      price: map["price"],
    );
  }

  // to convert class into map MAY  REQUIRE in FUTURE to store data
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "color": color,
        "image": image,
        "price": price,
      };
  
}
