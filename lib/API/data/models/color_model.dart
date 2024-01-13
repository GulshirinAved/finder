// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ColorModel {
  int id;
  String name_tm;
  String name_ru;
  String color;
  ColorModel({
    required this.id,
    required this.name_tm,
    required this.name_ru,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'color': color,
    };
  }

  factory ColorModel.fromJson(Map<String, dynamic> map) {
    return ColorModel(
      id: map['id'],
      name_tm: map['name_tm'],
      name_ru: map['name_ru'],
      color: map['color'],
    );
  }
}
