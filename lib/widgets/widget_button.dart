// ignore_for_file: public_member_api_docs, sort_constructors_first, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:oilproj/widgets/widget_text.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.data,
    required this.pressFunc,
  }) : super(key: key);

  final String data;
  final Function() pressFunc;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: pressFunc,
      child: WidgetText(data: data),color: Theme.of(context).primaryColor,
    );
  }
}
