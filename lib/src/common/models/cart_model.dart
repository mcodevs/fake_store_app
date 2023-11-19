class CartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;

  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toUtc().toIso8601String(),
      'products': products.map((e) => e.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, Object?> map) {
    return CartModel(
      id: map['id'] as int,
      userId: map['userId'] as int,
      date: DateTime.parse(map['date'] as String),
      products: CartProduct.fromDynamicToList(map['products']),
    );
  }

  static List<CartModel> fromDynamicToList(dynamic data) {
    return (data as List)
        .cast<Map>()
        .map((e) => CartModel.fromMap(e.cast<String, Object?>()))
        .toList();
  }
}

class CartProduct {
  final int productId;
  final int quantity;

  const CartProduct({
    required this.productId,
    required this.quantity,
  });

  Map<String, Object?> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartProduct.fromMap(Map<String, Object?> map) {
    return CartProduct(
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
    );
  }

  static List<CartProduct> fromDynamicToList(dynamic data) {
    return (data as List)
        .cast<Map>()
        .map((e) => CartProduct.fromMap(e.cast<String, Object?>()))
        .toList();
  }
}
