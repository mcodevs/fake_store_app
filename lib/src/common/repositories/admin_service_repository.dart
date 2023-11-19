import 'package:fake_store_app/src/common/models/cart_model.dart';
import 'package:fake_store_app/src/common/models/user_model.dart';

abstract class AdminServiceRepository {
  Future<List<UserModel>> getUsers();

  Future<UserModel> getUserByID(int userID);

  Future<List<CartModel>> getCartsByUserID(int userID);

  Future<List<CartModel>> getCarts({DateTime? startDate, DateTime? endDate});
}
