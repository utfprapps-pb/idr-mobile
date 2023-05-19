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
  int? propertyId;
  @HiveField(13)
  bool? bornInProperty;
  @HiveField(14)
  String? cowIdentifier;
  @HiveField(15)
  bool? dead;
  @HiveField(16)
  String? deadDate;

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
    this.propertyId,
    this.bornInProperty,
    this.cowIdentifier,
    this.dead,
    this.deadDate,
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
    int? propertyId,
    bool? bornInProperty,
    String? cowIdentifier,
    bool? dead,
    String? deadDate,
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
      propertyId: propertyId ?? this.propertyId,
      bornInProperty: bornInProperty ?? this.bornInProperty,
      cowIdentifier: cowIdentifier ?? this.cowIdentifier,
      dead: dead ?? this.dead,
      deadDate: deadDate ?? this.deadDate,
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
    if (propertyId != null) {
      result.addAll({'propertyId': propertyId});
    }
    if (bornInProperty != null) {
      result.addAll({'bornInProperty': bornInProperty});
    }
    if (cowIdentifier != null) {
      result.addAll({'cowIdentifier': cowIdentifier});
    }
    if (dead != null) {
      result.addAll({'dead': dead});
    }
    if (deadDate != null) {
      result.addAll({'deadDate': deadDate});
    }

    return result;
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
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
      propertyId: map['property']['id']?.toInt(),
      bornInProperty: map['bornInProperty'],
      cowIdentifier: map['cowIdentifier'],
      dead: map['dead'],
      deadDate: map['deadDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnimalModel(internalId: $internalId, id: $id, bornDate: $bornDate, bornWeight: $bornWeight, breed: $breed, currentWeight: $currentWeight, ecc: $ecc, identifier: $identifier, name: $name, previousWeight: $previousWeight, type: $type, propertyId: $propertyId, bornInProperty: $bornInProperty, cowIdentifier: $cowIdentifier, dead: $dead, deadDate: $deadDate)';
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
        other.propertyId == propertyId &&
        other.bornInProperty == bornInProperty &&
        other.cowIdentifier == cowIdentifier &&
        other.dead == dead &&
        other.deadDate == deadDate;
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
        propertyId.hashCode ^
        bornInProperty.hashCode ^
        cowIdentifier.hashCode ^
        dead.hashCode ^
        deadDate.hashCode;
  }
}
