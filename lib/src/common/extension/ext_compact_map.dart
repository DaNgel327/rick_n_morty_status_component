part of ext_lib;

/// Compact map
/// The current elements of this iterable modified by [Function(T element)]
///
/// Returns an indexable fixed length collection of non-nil objects
/// of calling the given transformation with each element of this sequence.
///
/// Transform the elements of an array just like map() does,
/// except once the transformation completes an extra step happens:
/// all optionals get unwrapped, and any nil values get discarded.
///
/// Example
/// ```dart
/// final List<String> results = ['1', '2', null, '3']
///   .compactMap((e) => e)
///   .forEach(print); // prints '1', '2', '3'
///
/// ```
extension CompactMap<T> on Iterable<T> {
  List<E> compactMap<E>(E? Function(T element) f) {
    Iterable<E> imp(E? Function(T element) f) sync* {
      for (final value in this) {
        final mapped = f(value);
        if (mapped != null) {
          yield mapped;
        }
      }
    }

    return imp(f).toList();
  }
}
