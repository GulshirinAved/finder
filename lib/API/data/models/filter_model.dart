import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:yitirdim/API/data/models/location_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModal {
  Posts posts;
  FilterModal({
    required this.posts,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'posts': posts.toJson(),
    };
  }

  factory FilterModal.fromJson(Map<String, dynamic> map) {
    return FilterModal(
      posts: Posts.fromJson(map['posts']),
    );
  }
}

class Posts {
  List<Data> data;
  Posts({
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'data': data.map((x) => x.toJson()).toList(),
    };
  }

  factory Posts.fromJson(Map<String, dynamic> map) {
    return Posts(
      data: List<Data>.from(
        (map['data'] as List<int>).map<Data>(
          (x) => Data.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class Data {
  int? id;
  int? category_id;
  int? location_id;
  int? color_id;
  int? client_id;
  String? name_tm;
  String? desc_tm;
  String? desc_ru;
  int? type_id;
  String? created_at;
  int? phone;
  int? height;
  int? weight;
  Category? category;
  Type? type;
  Location? location;
  List<dynamic>? images;
  Client? client;
  String? name_ru;
  int? approve;
  bool? status;
  Colors? color;
  Post? post;
  Data(
      {this.id,
      this.category_id,
      this.location_id,
      this.color_id,
      this.client_id,
      this.name_tm,
      this.desc_tm,
      this.desc_ru,
      this.type_id,
      this.created_at,
      this.phone,
      this.height,
      this.weight,
      this.category,
      this.type,
      this.location,
      this.images,
      this.client,
      this.name_ru,
      this.approve,
      this.status,
      this.color,
      this.post});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category_id': category_id,
      'location_id': location_id,
      'color_id': color_id,
      'client_id': client_id,
      'name_tm': name_tm,
      'desc_tm': desc_tm,
      'desc_ru': desc_ru,
      'type_id': type_id,
      'created_at': created_at,
      'phone': phone,
      'height': height,
      'weight': weight,
      'category': category?.toJson(),
      'type': type?.toJson(),
      'location': location?.toJson(),
      'images': images,
      'client': client?.toJson(),
      'name_ru': name_ru,
      'approve': approve,
      'status': status,
      'color': color?.toJson(),
      'post': post?.toJson()
    };
  }

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
        id: map['id'] != null ? map['id'] as int : null,
        category_id:
            map['category_id'] != null ? map['category_id'] as int : null,
        location_id:
            map['location_id'] != null ? map['location_id'] as int : null,
        color_id: map['color_id'] != null ? map['color_id'] as int : null,
        client_id: map['client_id'] != null ? map['client_id'] as int : null,
        name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
        desc_tm: map['desc_tm'] != null ? map['desc_tm'] as String : null,
        desc_ru: map['desc_ru'] != null ? map['desc_ru'] as String : null,
        type_id: map['type_id'] != null ? map['type_id'] as int : null,
        created_at:
            map['created_at'] != null ? map['created_at'] as String : null,
        phone: map['phone'] != null ? map['phone'] as int : null,
        height: map['height'] != null ? map['height'] as int : null,
        weight: map['weight'] != null ? map['weight'] as int : null,
        category: map['category'] != null
            ? Category.fromJson(map['category'] as Map<String, dynamic>)
            : null,
        type: map['type'] != null
            ? Type.fromJson(map['type'] as Map<String, dynamic>)
            : null,
        location: map['location'] != null
            ? Location.fromJson(map['location'] as Map<String, dynamic>)
            : null,
        images: map['images'] != null
            ? List<dynamic>.from((map['images'] as List<dynamic>))
            : null,
        client: map['client'] != null
            ? Client.fromJson(map['client'] as Map<String, dynamic>)
            : null,
        name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
        approve: map['approve'] != null ? map['approve'] as int : null,
        status: map['status'] != null ? map['status'] as bool : null,
        color: map['color'] != null
            ? Colors.fromJson(map['color'] as Map<String, dynamic>)
            : null,
        post: map['post'] != null
            ? Post.fromJson(map['post'] as Map<String, dynamic>)
            : null);
  }
}

class Colors {
  int? id;
  String? name_tm;
  String? name_ru;
  String? color;
  Colors({
    this.id,
    this.name_tm,
    this.name_ru,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'color': color,
    };
  }

  factory Colors.fromJson(Map<String, dynamic> map) {
    return Colors(
      id: map['id'] != null ? map['id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
      color: map['color'] != null ? map['color'] as String : null,
    );
  }
}

class Client {
  int? id;
  String? name;
  int? phone;
  String? image;
  Client({
    this.id,
    this.name,
    this.phone,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
    };
  }

  factory Client.fromJson(Map<String, dynamic> map) {
    return Client(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }
}

class Category {
  int? id;
  String? name_tm;
  String? name_ru;
  int? parent_id;
  Category({
    this.id,
    this.name_tm,
    this.name_ru,
    this.parent_id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'parent_id': parent_id,
    };
  }

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      id: map['id'] != null ? map['id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as int : null,
    );
  }
}

class Type {
  int? id;
  String? name_tm;
  String? name_ru;
  Type({
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

  factory Type.fromJson(Map<String, dynamic> map) {
    return Type(
      id: map['id'] != null ? map['id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
    );
  }
}

class Location {
  int? id;
  String? name_tm;
  String? name_ru;
  int? parent_id;
  Parent? parent;
  Location({
    this.id,
    this.name_tm,
    this.name_ru,
    this.parent_id,
    this.parent,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'parent_id': parent_id,
      'parent': parent?.toJson(),
    };
  }

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      id: map['id'] != null ? map['id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as int : null,
      parent: map['parent'] != null
          ? Parent.fromJson(map['parent'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Parent {
  int? id;
  int? parent_id;
  String? name_tm;
  String? name_ru;
  Parent({
    this.id,
    this.parent_id,
    this.name_tm,
    this.name_ru,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'parent_id': parent_id,
      'name_tm': name_tm,
      'name_ru': name_ru,
    };
  }

  factory Parent.fromJson(Map<String, dynamic> map) {
    return Parent(
      id: map['id'] != null ? map['id'] as int : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
    );
  }
}

class Post {
  int? id;
  int? category_id;
  int? location_id;
  int? color_id;
  int? client_id;
  String? name_tm;
  String? name_ru;

  String? desc_tm;
  String? desc_ru;
  int? type_id;
  String? created_at;
  int? phone;
  int? height;
  int? weight;
  Category? category;
  Type? type;
  Location? location;
  List<dynamic>? images;
  Client? client;
  int? approve;
  bool? status;
  Colors? color;
  Post({
    this.id,
    this.category_id,
    this.location_id,
    this.color_id,
    this.client_id,
    this.name_tm,
    this.name_ru,
    this.desc_tm,
    this.desc_ru,
    this.type_id,
    this.created_at,
    this.phone,
    this.height,
    this.weight,
    this.category,
    this.type,
    this.location,
    this.images,
    this.client,
    this.approve,
    this.status,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category_id': category_id,
      'location_id': location_id,
      'color_id': color_id,
      'client_id': client_id,
      'name_tm': name_tm,
      'name_ru': name_ru,
      'desc_tm': desc_tm,
      'desc_ru': desc_ru,
      'type_id': type_id,
      'created_at': created_at,
      'phone': phone,
      'height': height,
      'weight': weight,
      'category': category?.toJson(),
      'type': type?.toJson(),
      'location': location?.toJson(),
      'images': images,
      'client': client?.toJson(),
      'approve': approve,
      'status': status,
      'color': color?.toJson(),
    };
  }

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      id: map['id'] != null ? map['id'] as int : null,
      category_id:
          map['category_id'] != null ? map['category_id'] as int : null,
      location_id:
          map['location_id'] != null ? map['location_id'] as int : null,
      color_id: map['color_id'] != null ? map['color_id'] as int : null,
      client_id: map['client_id'] != null ? map['client_id'] as int : null,
      name_tm: map['name_tm'] != null ? map['name_tm'] as String : null,
      name_ru: map['name_ru'] != null ? map['name_ru'] as String : null,
      desc_tm: map['desc_tm'] != null ? map['desc_tm'] as String : null,
      desc_ru: map['desc_ru'] != null ? map['desc_ru'] as String : null,
      type_id: map['type_id'] != null ? map['type_id'] as int : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      phone: map['phone'] != null ? map['phone'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      category: map['category'] != null
          ? Category.fromJson(map['category'] as Map<String, dynamic>)
          : null,
      type: map['type'] != null
          ? Type.fromJson(map['type'] as Map<String, dynamic>)
          : null,
      location: map['location'] != null
          ? Location.fromJson(map['location'] as Map<String, dynamic>)
          : null,
      images: map['images'] != null
          ? List<dynamic>.from((map['images'] as List<dynamic>))
          : null,
      client: map['client'] != null
          ? Client.fromJson(map['client'] as Map<String, dynamic>)
          : null,
      approve: map['approve'] != null ? map['approve'] as int : null,
      status: map['status'] != null ? map['status'] as bool : null,
      color: map['color'] != null
          ? Colors.fromJson(map['color'] as Map<String, dynamic>)
          : null,
    );
  }
}
