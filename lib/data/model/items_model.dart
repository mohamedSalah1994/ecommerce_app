class ItemsModel {
  final int id;
  final String name;
  final String nameAr;
  final String desc;
  final String descAr;
  final String image;
  final int price;
  final int count;
  final int discount;
  final int active;
  final int categoryId;
  final String categoryName;
  final String categoryNameAr;
  final String categoryImage;
   int? favorite;

  ItemsModel({
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
    required this.categoryName,
    required this.categoryNameAr,
    required this.categoryImage,
     this.favorite,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      name: json['name'],
      nameAr: json['name_ar'],
      desc: json['desc'],
      descAr: json['desc_ar'],
      image: json['image'],
      price: json['price'],
      count: json['count'],
      discount: json['discount'],
      active: json['active'],
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      categoryNameAr: json['category_name_ar'],
      categoryImage: json['category_image'],
      favorite: json['favorite'],
    );
  }
}
