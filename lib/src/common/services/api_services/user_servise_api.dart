import 'package:fake_store_app/src/common/constants/api_const.dart';
import 'package:fake_store_app/src/common/models/product_model.dart';
import 'package:fake_store_app/src/common/repositories/user_service_repository.dart';
import 'package:fake_store_app/src/common/services/api_helper/api_helper.dart';

class UserServiceAPI implements UserServiceRepository {
  final ApiHelper _helper;

  const UserServiceAPI(this._helper);

  @override
  Future<List<ProductModel>> getAllProduct([bool isDesc = false]) async {
    final response = await _helper.request(
      ApiConst.allProductsPath,
      queryParameters: ApiConst.sortQueryParameter(isDesc),
    );

    return ProductModel.fromDynamicToList(response.data);
  }

  @override
  Future<ProductModel> getProductByID(int productID) async {
    final response = await _helper.request(
      ApiConst.singleProductPath(productID),
    );
    return ProductModel.fromMap((response.data as Map).cast<String, Object?>());
  }

  @override
  Future<List<ProductModel>> getProductByCategory(String category,
      [bool isDesc = false]) async {
    final response = await _helper.request(
      ApiConst.productsByCategory(category),
    );

    return ProductModel.fromDynamicToList(response.data);
  }
}
