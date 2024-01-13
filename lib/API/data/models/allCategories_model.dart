import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AllCategories {
  int id;
  int parent_id;
  int child_id;
  String name_tm;
  String name_ru;
  String image;
  List<ChildClass> child;
  AllCategories({
    required this.id,
    required this.parent_id,
    required this.child_id,
    required this.name_tm,
    required this.name_ru,
    required this.image,
    required this.child,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'parent_id': parent_id,
      'child_id': child_id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'image': image,
      'child': child.map((x) => x.toJson()).toList(),
    };
  }

  factory AllCategories.fromJson(Map<String, dynamic> map) {
    return AllCategories(
      id: map['id'] ?? 0,
      parent_id: map['parent_id'] ?? 0,
      child_id: map['child_id'] ?? 0,
      name_tm: map['name_tm'] ?? '',
      name_ru: map['name_ru'] ?? '',
      image: map['image'] ?? 'klagf',
      child: List<ChildClass>.from(
        (map['child']).map<ChildClass>(
          (x) => ChildClass.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class ChildClass {
  int id;
  int parent_id;
  int child_id;
  String name_tm;
  String name_ru;
  String image;
  ChildClass({
    required this.id,
    required this.parent_id,
    required this.child_id,
    required this.name_tm,
    required this.name_ru,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'parent_id': parent_id,
      'child_id': child_id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'image': image,
    };
  }

  factory ChildClass.fromJson(Map<String, dynamic> map) {
    return ChildClass(
      id: map['id'] ?? 0,
      parent_id: map['parent_id'] ?? 0,
      child_id: map['child_id'] ?? 0,
      name_tm: map['name_tm'] ?? '',
      name_ru: map['name_ru'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
