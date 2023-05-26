// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 13)
class DiseaseModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? diseaseName;

  DiseaseModel({
    this.internalId,
    this.id,
    this.diseaseName,
  });

  DiseaseModel copyWith({
    String? internalId,
    int? id,
    String? diseaseName,
  }) {
    return DiseaseModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      diseaseName: diseaseName ?? this.diseaseName,
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
    if (diseaseName != null) {
      result.addAll({'diseaseName': diseaseName});
    }

    return result;
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      diseaseName: map['diseaseName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) =>
      DiseaseModel.fromMap(json.decode(source));

  @override
  String toString() => '$id - $diseaseName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiseaseModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.diseaseName == diseaseName;
  }

  @override
  int get hashCode => internalId.hashCode ^ id.hashCode ^ diseaseName.hashCode;
}
