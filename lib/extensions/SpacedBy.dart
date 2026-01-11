import 'package:flutter/material.dart';

extension SpacedBy on List<Widget> {
  List<Widget> spacedBy(double space) {
    if (isEmpty) return this;
    return List.generate(length * 2 - 1, (index) {
      if (index.isEven) return this[index ~/ 2];
      return SizedBox(height: space, width: space);
    });
  }
}
