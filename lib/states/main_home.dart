import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'MapTree',
    'AddTree',
    'MyProfile',
  ];

  var iconDatas = <IconData>[Icons.map, Icons.park, Icons.perm_identity];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
