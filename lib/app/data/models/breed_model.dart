// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'breed_model.g.dart';

@HiveType(typeId: 12)
class BreedModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? breedName;

  BreedModel({
    this.internalId,
    this.id,
    this.breedName,
  });

  BreedModel copyWith({
    String? internalId,
    int? id,
    String? breedName,
  }) {
    return BreedModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      breedName: breedName ?? this.breedName,
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
    if (breedName != null) {
      result.addAll({'breedName': breedName});
    }

    return result;
  }

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      breedName: map['breedName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMap(json.decode(source));

  @override
  String toString() => '$id - $breedName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BreedModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.breedName == breedName;
  }

  @override
  int get hashCode => internalId.hashCode ^ id.hashCode ^ breedName.hashCode;
}
