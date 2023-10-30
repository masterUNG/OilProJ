import 'package:flutter/material.dart';

class AppConstant {
  TextStyle h1Style() =>
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  TextStyle h2Style() =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle h3Style() =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

  BoxDecoration borderBox() => BoxDecoration(border: Border.all());
}
