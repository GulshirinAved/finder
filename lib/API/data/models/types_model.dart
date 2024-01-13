import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TypesModel {
  int? id;
  String? name_tm;
  String? name_ru;
  TypesModel({
    this.id,
    this.name_tm,
    this.name_ru,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name_tm': name_tm,
      'name_ru': name_ru,
    };
  }

  factory TypesModel.fromJson(Map<String, dynamic> map) {
    return TypesModel(
      id: map['id'] != null ? map['id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
    );
  }
}
