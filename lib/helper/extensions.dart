//helper functions

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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

  //animate list
  List<Widget> get animateList => (this as List<Widget>)
      .animate(interval: const Duration(milliseconds: 200))
      .fadeIn(duration: const Duration(milliseconds: 400))
      .slideY(
          begin: 0.50, end: 0.0, duration: const Duration(milliseconds: 300));
}
