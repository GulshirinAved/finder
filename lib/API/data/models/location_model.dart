// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocationModal {
  final int id;
  final int parentId;
  final String nameTm;
  final String nameRu;

  LocationModal({
    required this.id,
    required this.parentId,
    required this.nameTm,
    required this.nameRu,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'nameTm': nameTm,
      'nameRu': nameRu,
    };
  }

  factory LocationModal.fromMap(Map<String, dynamic> map) {
    return LocationModal(
      id: map['id'] as int,
      parentId: map['parentId'],
      nameTm: map['nameTm'] as String,
      nameRu: map['nameRu'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModal.fromJson(String source) =>
      LocationModal.fromMap(json.decode(source) as Map<String, dynamic>);
}
