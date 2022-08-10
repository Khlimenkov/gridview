import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}
