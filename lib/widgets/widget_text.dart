import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    super.key,
    required this.data,
    this.textStyle,
  });

  final String data;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: textStyle,);
  }
}
