import 'package:flutter/material.dart';

extension ExtensionContext on BuildContext {
  double get getHeight => MediaQuery.sizeOf(this).height;
  double get getWidth => MediaQuery.sizeOf(this).width;
}
