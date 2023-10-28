import 'package:flutter/material.dart';

class WidgetImage extends StatelessWidget {
  const WidgetImage({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/logo.png',
      width: size,
      height: size,
    );
  }
}
