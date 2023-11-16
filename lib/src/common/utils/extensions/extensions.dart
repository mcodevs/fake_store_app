extension DateTimeExtension on DateTime {
  /// This method converts a DateTime object to the
  /// format "yyyy-mm-dd" as a String
  String toStringForAPI() {
    return "$year-${month.toString().padLeft(2, "0")}"
        "-${day.toString().padLeft(2, "0")}";
  }
}
