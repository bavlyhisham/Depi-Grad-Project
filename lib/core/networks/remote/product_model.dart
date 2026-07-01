class Product {
  String id;
  String title;
  String slug;
  double price;
  String description;
  Category category;
  List<String> images;
  // DateTime creationAt;
  // DateTime updatedAt;
  String imagecover;
  double ratingsAverage;
  double? sold;
  int ratingsQuantity;
  int quantity;
  int priceAfterDiscount;
  Product({
    required this.id,
    required this.quantity,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.sold,
    // required this.creationAt,
    // required this.updatedAt,
    required this.imagecover,
    required this.ratingsQuantity,
    required this.ratingsAverage,
    required this.priceAfterDiscount,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      priceAfterDiscount: json['priceAfterDiscount'] != null
          ? (json['priceAfterDiscount'] as num).toInt()
          : 0,
      quantity: json['quantity'] != null
          ? (json['quantity'] as num).toInt()
          : 0,
      ratingsQuantity: json['ratingsQuantity'] != null
          ? (json['ratingsQuantity'] as num).toInt()
          : 0,
      sold: json['sold'] != null ? (json['sold'] as num).toDouble() : 0,
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
      imagecover: json['imageCover'],
      // creationAt: DateTime.parse(json['creationAt']),
      // updatedAt: DateTime.parse(json['updatedAt'])  ,
    );
  }
}

class Category {
  final String id;
  final String name;
  final String slug;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      slug: json['slug'],
      name: json['name'],
      image: json['image'],
    );
  }
}

