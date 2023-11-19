import 'package:fake_store_app/src/common/constants/api_const.dart';
import 'package:fake_store_app/src/common/models/cart_model.dart';
import 'package:fake_store_app/src/common/models/user_model.dart';
import 'package:fake_store_app/src/common/repositories/admin_service_repository.dart';
import 'package:fake_store_app/src/common/services/api_helper/api_helper.dart';

class AdminServiceAPI implements AdminServiceRepository {
  final ApiHelper _helper;

  const AdminServiceAPI(this._helper);

  @override
  Future<List<CartModel>> getCarts({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final response = await _helper.request(
      ApiConst.allCartsPath,
      queryParameters: ApiConst.dataRangeQueryParameter(
        startDate: startDate,
        endDate: endDate,
      ),
    );
    return CartModel.fromDynamicToList(response.data);
  }

  @override
  Future<List<CartModel>> getCartsByUserID(int userID) async {
    final response = await _helper.request(
      ApiConst.cartsByUserID(userID),
    );

    return CartModel.fromDynamicToList(response.data);
  }

  @override
  Future<UserModel> getUserByID(int userID) async {
    final response = await _helper.request(
      ApiConst.singleUserByID(userID),
    );
    return UserModel.fromMap(
      (response.data as Map).cast<String, Object?>(),
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _helper.request(ApiConst.allUsersPath);
    return UserModel.fromDynamicToList(response.data);
  }
}
