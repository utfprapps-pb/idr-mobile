// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'animal_model.g.dart';

@HiveType(typeId: 1)
class AnimalModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? bornDate;
  @HiveField(4)
  double? bornWeight;
  @HiveField(5)
  String? breed;
  @HiveField(6)
  double? currentWeight;
  @HiveField(7)
  double? ecc;
  @HiveField(8)
  String? identifier;
  @HiveField(9)
  String? name;
  @HiveField(10)
  double? previousWeight;
  @HiveField(11)
  String? type;
  @HiveField(12)
  int? idProperty;
  @HiveField(13)
  bool? bornInProperty;
  @HiveField(14)
  String? animalMotherIdentifier;
  @HiveField(15)
  bool? dead;
  @HiveField(16)
  String? deadDate;
  @HiveField(17)
  String? bornCondition;
  @HiveField(18)
  String? gender;

  AnimalModel({
    this.internalId,
    this.id,
    this.bornDate,
    this.bornWeight,
    this.breed,
    this.currentWeight,
    this.ecc,
    this.identifier,
    this.name,
    this.previousWeight,
    this.type,
    this.idProperty,
    this.bornInProperty,
    this.animalMotherIdentifier,
    this.dead,
    this.deadDate,
    this.bornCondition,
    this.gender,
  });

  AnimalModel copyWith({
    String? internalId,
    int? id,
    String? bornDate,
    double? bornWeight,
    String? breed,
    double? currentWeight,
    double? ecc,
    String? identifier,
    String? name,
    double? previousWeight,
    String? type,
    int? idProperty,
    bool? bornInProperty,
    String? animalMotherIdentifier,
    bool? dead,
    String? deadDate,
    String? bornCondition,
    String? gender,
  }) {
    return AnimalModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      bornDate: bornDate ?? this.bornDate,
      bornWeight: bornWeight ?? this.bornWeight,
      breed: breed ?? this.breed,
      currentWeight: currentWeight ?? this.currentWeight,
      ecc: ecc ?? this.ecc,
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      previousWeight: previousWeight ?? this.previousWeight,
      type: type ?? this.type,
      idProperty: idProperty ?? this.idProperty,
      bornInProperty: bornInProperty ?? this.bornInProperty,
      animalMotherIdentifier:
          animalMotherIdentifier ?? this.animalMotherIdentifier,
      dead: dead ?? this.dead,
      deadDate: deadDate ?? this.deadDate,
      bornCondition: bornCondition ?? this.bornCondition,
      gender: gender ?? this.gender,
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
    if (bornDate != null) {
      result.addAll({'bornDate': bornDate});
    }
    if (bornWeight != null) {
      result.addAll({'bornWeight': bornWeight});
    }
    if (breed != null) {
      result.addAll({'breed': breed});
    }
    if (currentWeight != null) {
      result.addAll({'currentWeight': currentWeight});
    }
    if (ecc != null) {
      result.addAll({'ecc': ecc});
    }
    if (identifier != null) {
      result.addAll({'identifier': identifier});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (previousWeight != null) {
      result.addAll({'previousWeight': previousWeight});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (idProperty != null) {
      result.addAll({'idProperty': idProperty});
    }
    if (bornInProperty != null) {
      result.addAll({'bornInProperty': bornInProperty});
    }
    if (animalMotherIdentifier != null) {
      result.addAll({'animalMotherIdentifier': animalMotherIdentifier});
    }
    if (dead != null) {
      result.addAll({'dead': dead});
    }
    if (deadDate != null) {
      result.addAll({'deadDate': deadDate});
    }
    if (bornCondition != null) {
      result.addAll({'bornCondition': bornCondition});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }

    return result;
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    String? animalMotherIdentifier;
    if (map['animal'] != null) {
      animalMotherIdentifier = map['animal']['identifier'];
    }

    return AnimalModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      bornDate: map['bornDate'],
      bornWeight: map['bornWeight']?.toDouble(),
      breed: map['breed'],
      currentWeight: map['currentWeight']?.toDouble(),
      ecc: map['ecc']?.toDouble(),
      identifier: map['identifier'],
      name: map['name'],
      previousWeight: map['previousWeight']?.toDouble(),
      type: map['type'],
      idProperty: map['property']['id']?.toInt(),
      bornInProperty: map['bornInProperty'],
      animalMotherIdentifier: animalMotherIdentifier,
      dead: map['dead'],
      deadDate: map['deadDate'],
      bornCondition: map['bornCondition'],
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$id - $identifier - $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimalModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.bornDate == bornDate &&
        other.bornWeight == bornWeight &&
        other.breed == breed &&
        other.currentWeight == currentWeight &&
        other.ecc == ecc &&
        other.identifier == identifier &&
        other.name == name &&
        other.previousWeight == previousWeight &&
        other.type == type &&
        other.idProperty == idProperty &&
        other.bornInProperty == bornInProperty &&
        other.animalMotherIdentifier == animalMotherIdentifier &&
        other.dead == dead &&
        other.deadDate == deadDate &&
        other.bornCondition == bornCondition &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        bornDate.hashCode ^
        bornWeight.hashCode ^
        breed.hashCode ^
        currentWeight.hashCode ^
        ecc.hashCode ^
        identifier.hashCode ^
        name.hashCode ^
        previousWeight.hashCode ^
        type.hashCode ^
        idProperty.hashCode ^
        bornInProperty.hashCode ^
        animalMotherIdentifier.hashCode ^
        dead.hashCode ^
        deadDate.hashCode ^
        bornCondition.hashCode ^
        gender.hashCode;
  }
}
