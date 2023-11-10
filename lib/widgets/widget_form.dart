// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    this.hint,
    this.suffigWidget,
    this.labelWidget,
    this.validateFunc,
    this.textEditingController,
  }) : super(key: key);

  final String? hint;
  final Widget? suffigWidget;
  final Widget? labelWidget;
  final String? Function(String?)? validateFunc;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: textEditingController,
        validator: validateFunc,
        decoration: InputDecoration(
          label: labelWidget,
          hintText: hint,
          suffixIcon: suffigWidget,
          filled: true,fillColor: Colors.grey.shade200,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
