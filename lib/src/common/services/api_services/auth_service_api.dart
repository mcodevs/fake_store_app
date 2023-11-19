import 'package:dio/dio.dart';
import 'package:fake_store_app/src/common/constants/api_const.dart';
import 'package:fake_store_app/src/common/models/user_model.dart';
import 'package:fake_store_app/src/common/services/api_helper/api_helper.dart';
import 'package:fake_store_app/src/common/services/api_services/admin_service_api.dart';
import 'package:fake_store_app/src/common/utils/exceptions/exception.dart';
import 'package:flutter/foundation.dart' show debugPrint;

class AuthServiceAPI {
  final ApiHelper _helper;

  AuthServiceAPI(this._helper);

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _helper.request(
        ApiConst.loginPath,
        body: ApiConst.loginRequestBody(username: username, password: password),
        method: Method.post,
      );
      debugPrint(response.data.toString());
      final users = await AdminServiceAPI(_helper).getUsers();
      return users.firstWhere((element) => element.username == username);
    } on DioException catch (e) {
      throw FakeApiException(
        e.response!.statusCode == 401
            ? "Username or password not correct"
            : "Something went wrong",
        e.response!.statusCode!,
      );
    }
  }
}
