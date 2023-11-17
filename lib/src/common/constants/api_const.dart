import 'package:fake_store_app/src/common/utils/extensions/extensions.dart';

abstract final class ApiConst {
  /// Base URL path
  static const baseUrl = "https://fakestoreapi.com";

  /// All Products path
  static const allProductsPath = "/products";

  /// Single Product path by productID
  static String singleProductPath(int productID) =>
      "$allProductsPath/$productID";

  /// All Categories
  static const allCategories = "$allProductsPath/categories";

  /// Product by Category
  static String productsByCategory(String category) =>
      "$allProductsPath/category/$category";

  /// All Users path
  static const allUsersPath = "/users";

  /// Single user path by ID
  static String singleUserByID(int userID) => "$allProductsPath/$userID";

  /// All Carts path
  static const allCartsPath = "/carts";

  /// Single Cart path by Cart ID
  static String singleCartByID(int cartID) => "$allCartsPath/$cartID";

  /// Carts by User ID
  static String cartsByUserID(int userID) => "$allCartsPath/user/$userID";

  /// Query for data range
  static Map<String, Object?> dataRangeQueryParameter({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return {
      if (startDate != null) "startdate": startDate.toStringForAPI(),
      if (endDate != null) "enddate": endDate.toStringForAPI(),
    };
  }
}
