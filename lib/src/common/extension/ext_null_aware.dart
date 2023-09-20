part of ext_lib;

/// Null aware cascade operator
/// x.let(f) instead of f(x)
///
/// Can simplify the following construction:
/// title == null ? null : Text(title!),
///
/// into:
/// title?.let(Text.new)
extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
}
