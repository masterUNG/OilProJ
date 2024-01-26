import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TreeDataModel {
  final String id;
  final String idRec;
  final String idTree;
  final String nameTree;
  final String urlImage;
  final String lat;
  final String lng;
  final String dateTimeRec;
  TreeDataModel({
    required this.id,
    required this.idRec,
    required this.idTree,
    required this.nameTree,
    required this.urlImage,
    required this.lat,
    required this.lng,
    required this.dateTimeRec,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idRec': idRec,
      'idTree': idTree,
      'nameTree': nameTree,
      'urlImage': urlImage,
      'lat': lat,
      'lng': lng,
      'dateTimeRec': dateTimeRec,
    };
  }

  factory TreeDataModel.fromMap(Map<String, dynamic> map) {
    return TreeDataModel(
      id: (map['id'] ?? '') as String,
      idRec: (map['idRec'] ?? '') as String,
      idTree: (map['idTree'] ?? '') as String,
      nameTree: (map['nameTree'] ?? '') as String,
      urlImage: (map['urlImage'] ?? '') as String,
      lat: (map['lat'] ?? '') as String,
      lng: (map['lng'] ?? '') as String,
      dateTimeRec: (map['dateTimeRec'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreeDataModel.fromJson(String source) => TreeDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
