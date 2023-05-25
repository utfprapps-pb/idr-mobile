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
  String? typeInfection;
  @HiveField(4)
  String? culture;
  @HiveField(5)
  String? diseaseIdentification;
  @HiveField(6)
  String? vegetableIdentifier;

  VegetableDiseaseModel({
    this.internalId,
    this.id,
    this.typeInfection,
    this.culture,
    this.diseaseIdentification,
    this.vegetableIdentifier,
  });

  VegetableDiseaseModel copyWith({
    String? internalId,
    int? id,
    String? typeInfection,
    String? culture,
    String? diseaseIdentification,
    String? vegetableIdentifier,
  }) {
    return VegetableDiseaseModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      typeInfection: typeInfection ?? this.typeInfection,
      culture: culture ?? this.culture,
      diseaseIdentification:
          diseaseIdentification ?? this.diseaseIdentification,
      vegetableIdentifier: vegetableIdentifier ?? this.vegetableIdentifier,
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
    if (typeInfection != null) {
      result.addAll({'typeInfection': typeInfection});
    }
    if (culture != null) {
      result.addAll({'culture': culture});
    }
    if (diseaseIdentification != null) {
      result.addAll({'diseaseIdentification': diseaseIdentification});
    }
    if (vegetableIdentifier != null) {
      result.addAll({'vegetableIdentifier': vegetableIdentifier});
    }

    return result;
  }

  factory VegetableDiseaseModel.fromMap(Map<String, dynamic> map) {
    return VegetableDiseaseModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      typeInfection: map['typeInfection'],
      culture: map['culture'],
      diseaseIdentification: map['diseaseIdentification'],
      vegetableIdentifier: map['vegetableIdentifier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VegetableDiseaseModel.fromJson(String source) =>
      VegetableDiseaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VegetableDiseaseModel(internalId: $internalId, id: $id, typeInfection: $typeInfection, culture: $culture, diseaseIdentification: $diseaseIdentification, vegetableIdentifier: $vegetableIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VegetableDiseaseModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.typeInfection == typeInfection &&
        other.culture == culture &&
        other.diseaseIdentification == diseaseIdentification &&
        other.vegetableIdentifier == vegetableIdentifier;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        typeInfection.hashCode ^
        culture.hashCode ^
        diseaseIdentification.hashCode ^
        vegetableIdentifier.hashCode;
  }
}
