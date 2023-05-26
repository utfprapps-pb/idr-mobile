// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vegetable_disease_model.g.dart';

@HiveType(typeId: 11)
class VegetableDiseaseModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? infestationType;
  @HiveField(4)
  String? date;
  @HiveField(5)
  int? idProperty;
  @HiveField(6)
  int? idCulture;
  @HiveField(7)
  int? idDisease;
  VegetableDiseaseModel({
    this.internalId,
    this.id,
    this.infestationType,
    this.date,
    this.idProperty,
    this.idCulture,
    this.idDisease,
  });

  VegetableDiseaseModel copyWith({
    String? internalId,
    int? id,
    String? infestationType,
    String? date,
    int? idProperty,
    int? idCulture,
    int? idDisease,
  }) {
    return VegetableDiseaseModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      infestationType: infestationType ?? this.infestationType,
      date: date ?? this.date,
      idProperty: idProperty ?? this.idProperty,
      idCulture: idCulture ?? this.idCulture,
      idDisease: idDisease ?? this.idDisease,
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
    if (infestationType != null) {
      result.addAll({'infestationType': infestationType});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (idProperty != null) {
      result.addAll({'idProperty': idProperty});
    }
    if (idCulture != null) {
      result.addAll({'idCulture': idCulture});
    }
    if (idDisease != null) {
      result.addAll({'idDisease': idDisease});
    }

    return result;
  }

  factory VegetableDiseaseModel.fromMap(Map<String, dynamic> map) {
    return VegetableDiseaseModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      infestationType: map['infestationType'],
      date: map['date'],
      idProperty: map['idProperty']?.toInt(),
      idCulture: map['idCulture']?.toInt(),
      idDisease: map['idDisease']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory VegetableDiseaseModel.fromJson(String source) =>
      VegetableDiseaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VegetableDiseaseModel(internalId: $internalId, id: $id, infestationType: $infestationType, date: $date, idProperty: $idProperty, idCulture: $idCulture, idDisease: $idDisease)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VegetableDiseaseModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.infestationType == infestationType &&
        other.date == date &&
        other.idProperty == idProperty &&
        other.idCulture == idCulture &&
        other.idDisease == idDisease;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        infestationType.hashCode ^
        date.hashCode ^
        idProperty.hashCode ^
        idCulture.hashCode ^
        idDisease.hashCode;
  }
}
