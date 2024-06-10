//helper functions

extension MyString on String {
  DateTime? get dateTime => DateTime.tryParse(this);

  bool get isValid => trim().isNotEmpty;
}

extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(int index, T item) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(index, this[index]);
    }
  }
}
