import 'package:flutter/material.dart';
import 'package:oilproj/widgets/widget_text.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: WidgetText(data: 'This is intro ทดสอบการ Revert')),);
  }
}