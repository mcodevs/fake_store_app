import 'package:fake_store_app/src/common/models/product_model.dart';

abstract interface class ApiServiceRepository {
  Future<List<ProductModel>> getAllProduct();

  Future<ProductModel> getProductByID(int productID);
}
