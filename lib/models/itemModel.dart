class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items;

  Item getItemById(int id) => items.firstWhere((element) => element.id == id);

  Item getItemByPos(int position) => items[position];
}

class Item {
  final num id;
  final String name;
  final String color;
  final num price;
  final String image;
  final String desc;

  Item({this.id, this.name, this.color, this.price, this.image, this.desc});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      color: map["color"],
      price: map["price"],
      image: map["image"],
      desc: map["desc"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "color": color,
        "price": price,
        "image": image,
        "desc": desc
      };
}
