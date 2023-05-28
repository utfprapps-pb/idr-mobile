// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_model.g.dart';

@HiveType(typeId: 17)
class ProductModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? applicationWay;
  @HiveField(6)
  String? activePrincipleName;
  @HiveField(7)
  String? categoryName;

  ProductModel({
    this.internalId,
    this.id,
    this.name,
    this.description,
    this.applicationWay,
    this.activePrincipleName,
    this.categoryName,
  });

  ProductModel copyWith({
    String? internalId,
    int? id,
    String? name,
    String? description,
    String? applicationWay,
    String? activePrincipleName,
    String? categoryName,
  }) {
    return ProductModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      applicationWay: applicationWay ?? this.applicationWay,
      activePrincipleName: activePrincipleName ?? this.activePrincipleName,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (internalId != null) {
      result.addAll({'internalId': internalId});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (applicationWay != null) {
      result.addAll({'applicationWay': applicationWay});
    }
    if (activePrincipleName != null) {
      result.addAll({'activePrincipleName': activePrincipleName});
    }
    if (categoryName != null) {
      result.addAll({'categoryName': categoryName});
    }

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      applicationWay: map['applicationWay'],
      activePrincipleName: map['activePrinciple']['name'],
      categoryName: map['category']['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$id - $name';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.applicationWay == applicationWay &&
        other.activePrincipleName == activePrincipleName &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        applicationWay.hashCode ^
        activePrincipleName.hashCode ^
        categoryName.hashCode;
  }
}
