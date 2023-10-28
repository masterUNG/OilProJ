// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:oilproj/widgets/widget_text.dart';

class WidgetTextButton extends StatelessWidget {
  const WidgetTextButton({
    Key? key,
    required this.data,
    required this.pressFunc,
  }) : super(key: key);

  final String data;
  final Function() pressFunc;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: pressFunc, child: WidgetText(data: data));
  }
}
