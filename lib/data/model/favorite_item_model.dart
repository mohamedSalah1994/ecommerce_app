class FavoriteItem {
   int? userId;
  final int id;
  final String name;
  final String nameAr;
  final String description;
  final String descriptionAr;
  final String image;
  final double price;
  final int count;
  final int discount;
  final int active;
  final int categoryId;
  final String createdAt;
  final String updatedAt;

  FavoriteItem({
     this.userId,
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.price,
    required this.count,
    required this.discount,
    required this.active,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      userId: json['user_id'],
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      description: json['desc'],
      descriptionAr: json['desc_ar'],
      image: json['image'],
      price: json['price'].toDouble(),
      count: json['count'],
      discount: json['discount'],
      active: json['active'],
      categoryId: json['category_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}






