class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RateModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, Object?> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      rating: RateModel.fromMap((map['rating'] as Map).cast<String, Object?>()),
    );
  }

  static List<ProductModel> fromDynamicToList(dynamic data) {
    return (data as List)
        .cast<Map>()
        .map((e) => ProductModel.fromMap(e.cast<String, Object?>()))
        .toList();
  }
}

class RateModel {
  final num rate;
  final int count;

  const RateModel({
    required this.rate,
    required this.count,
  });

  Map<String, Object?> toMap() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  factory RateModel.fromMap(Map<String, Object?> map) {
    return RateModel(
      rate: map['rate'] as num,
      count: map['count'] as int,
    );
  }
}
