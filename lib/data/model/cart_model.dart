class CartModel {
  final String status;
  final List<CartItem> items;
  final int totalItemsCount;
  final int totalPrice;

  CartModel({
    required this.status,
    required this.items,
    required this.totalItemsCount,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>;
    final items = itemsJson.map((itemJson) {
      return CartItem.fromJson(itemJson);
    }).toList();

    return CartModel(
      status: json['status'],
      items: items,
      totalItemsCount: json['totalItemsCount'],
      totalPrice: json['totalPrice'],
    );
  }
}

class CartItem {
  final int id;
  final String name;
  final String nameAr;
  final String desc;
  final String descAr;
  final String image;
  final double price;
  final int count;
  final int discount;
  final int active;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;
  final int quantity;
  final int totalCountPrice;

  CartItem( {
    required this.id,
    required this.name,
    required this.nameAr,
    required this.desc,
    required this.descAr,
    required this.image,
    required this.price,
    required this.count,
    required this.discount,
    required this.active,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.quantity,
    required this.totalCountPrice
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      desc: json['desc'],
      descAr: json['desc_ar'],
      image: json['image'],
      price: json['price'].toDouble(),
      count: json['count'],
      discount: json['discount'],
      active: json['active'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: Pivot.fromJson(json['pivot']),
      quantity: json['quantity'],
      totalCountPrice: json['totalCountPrice'],
    );
  }
}

class Pivot {
  final int userId;
  final int itemId;
  final int quantity;

  Pivot({
    required this.userId,
    required this.itemId,
    required this.quantity,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      itemId: json['item_id'],
      quantity: json['quantity'],
    );
  }
}
