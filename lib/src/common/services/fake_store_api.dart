import 'package:dio/dio.dart';
import 'package:fake_store_app/src/common/constants/api_const.dart';
import 'package:fake_store_app/src/common/models/product_model.dart';
import 'package:fake_store_app/src/common/repositories/api_service_repository.dart';
import 'package:fake_store_app/src/common/utils/exceptions/exception.dart';

class FakeStoreApi implements ApiServiceRepository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      contentType: "application/json",
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      connectTimeout: const Duration(seconds: 20),
    ),
  );

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await _dio.get(ApiConst.allProductsPath);
    if (response.statusCode == 200) {
      return (response.data as List)
          .cast<Map>()
          .map((e) => ProductModel.fromMap(e.cast<String, Object?>()))
          .toList();
    } else {
      throw FakeApiException(
        response.statusMessage!,
        response.statusCode!,
      );
    }
  }

  @override
  Future<ProductModel> getProductByID(int productID) async {
    final response = await _dio.get(ApiConst.singleProductPath(productID));
    if (response.statusCode == 200) {
      return ProductModel.fromMap(
          (response.data as Map).cast<String, Object?>());
    } else {
      throw FakeApiException(
        response.statusMessage!,
        response.statusCode!,
      );
    }
  }
}
