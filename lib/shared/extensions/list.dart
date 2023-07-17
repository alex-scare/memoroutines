extension ListExt<T> on List<T> {
  Iterable<R> mapWithIndex<R>(R Function(T, int i) callback) {
    return asMap().keys.toList().map((index) => callback(this[index], index));
  }
}
