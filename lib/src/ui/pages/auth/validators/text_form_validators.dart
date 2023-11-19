abstract final class TextFormValidators {
  static String? usernameValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Username is required.";
      } else if (value.contains(" ")) {
        return "Username is invalid.";
      } else {
        return null;
      }
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Email is required.";
      } else if (!value.contains(RegExp(r"^\w+@[A-z]+\.[A-z]{2,5}$"))) {
        return "Email is invalid.";
      } else {
        return null;
      }
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return "Password is required.";
      } else {
        return null;
      }
    }
    return null;
  }

  static String? rePasswordValidator(String? value, String password) {
    if (value != password) {
      return "Password does not match";
    }
    return passwordValidator(value);
  }
}
