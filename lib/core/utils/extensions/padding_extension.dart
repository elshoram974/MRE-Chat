import 'package:flutter/material.dart';

extension MyPaddingWidget on double {
  SizedBox get hightPadding => SizedBox(height: this);
  SizedBox get widthPadding => SizedBox(height: this);
}
