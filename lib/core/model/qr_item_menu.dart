class MenuItem {
  String name;
  String image;

  MenuItem({required this.name, required this.image});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}

class Restaurant {
  String restaurant;
  List<MenuItem> menuItems;

  Restaurant({required this.restaurant, required this.menuItems});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var list = json['menu_items'] as List;
    List<MenuItem> menuItemsList =
        list.map((i) => MenuItem.fromJson(i)).toList();

    return Restaurant(
      restaurant: json['restaurant'],
      menuItems: menuItemsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurant': restaurant,
      'menu_items': menuItems.map((item) => item.toJson()).toList(),
    };
  }
}
