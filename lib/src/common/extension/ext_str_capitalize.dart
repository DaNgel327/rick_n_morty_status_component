part of ext_lib;

/// Set first string char to uppercase
///
/// Usage:
/// ```dart
/// final str = 'hello';
/// print(str.capitalize());
/// ```
///
/// Output => Hello
extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}"
      "${substring(1).toLowerCase()}";
}
