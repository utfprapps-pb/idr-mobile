// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vegetable_model.g.dart';

@HiveType(typeId: 10)
class VegetableModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? name;
  @HiveField(4)
  int? propertyId;

  VegetableModel({
    this.internalId,
    this.id,
    this.name,
    this.propertyId,
  });

  VegetableModel copyWith({
    String? internalId,
    int? id,
    String? name,
    int? propertyId,
  }) {
    return VegetableModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      name: name ?? this.name,
      propertyId: propertyId ?? this.propertyId,
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
    if (propertyId != null) {
      result.addAll({'propertyId': propertyId});
    }

    return result;
  }

  factory VegetableModel.fromMap(Map<String, dynamic> map) {
    return VegetableModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      name: map['name'],
      propertyId: map['property']['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory VegetableModel.fromJson(String source) =>
      VegetableModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VegetableModel(internalId: $internalId, id: $id, name: $name, propertyId: $propertyId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VegetableModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.name == name &&
        other.propertyId == propertyId;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        propertyId.hashCode;
  }
}
