import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BannerModel {
  int? id;
  String? name;
  String? image;
  int? sort_order;
  BannerModel({
    this.id,
    this.name,
    this.image,
    this.sort_order,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'sort_order': sort_order,
    };
  }

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      sort_order: map['sort_order'],
    );
  }
}
