import 'package:fake_store_app/src/common/models/product_model.dart';

abstract interface class UserServiceRepository {
  Future<List<ProductModel>> getAllProduct([bool isDesc = false]);

  Future<ProductModel> getProductByID(int productID);

  Future<List<ProductModel>> getProductByCategory(
    String category, [
    bool isDesc = false,
  ]);
}
