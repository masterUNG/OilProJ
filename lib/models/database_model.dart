import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DatabaseModel {
  final String id;
  final String familyname;
  final String name;
  final String scientificname;
  final String anothername;
  final String nature;
  final String blade;
  final String flower;
  final String result;
  final String floweringandfruitingtime;
  final String utilization;
  DatabaseModel({
    required this.id,
    required this.familyname,
    required this.name,
    required this.scientificname,
    required this.anothername,
    required this.nature,
    required this.blade,
    required this.flower,
    required this.result,
    required this.floweringandfruitingtime,
    required this.utilization,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'familyname': familyname,
      'name': name,
      'scientificname': scientificname,
      'anothername': anothername,
      'nature': nature,
      'blade': blade,
      'flower': flower,
      'result': result,
      'floweringandfruitingtime': floweringandfruitingtime,
      'utilization': utilization,
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
      id: (map['id'] ?? '') as String,
      familyname: (map['familyname'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      scientificname: (map['scientificname'] ?? '') as String,
      anothername: (map['anothername'] ?? '') as String,
      nature: (map['nature'] ?? '') as String,
      blade: (map['blade'] ?? '') as String,
      flower: (map['flower'] ?? '') as String,
      result: (map['result'] ?? '') as String,
      floweringandfruitingtime: (map['floweringandfruitingtime'] ?? '') as String,
      utilization: (map['utilization'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DatabaseModel.fromJson(String source) => DatabaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
