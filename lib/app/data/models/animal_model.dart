// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'animal_model.g.dart';

@HiveType(typeId: 1)
class AnimalModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? bornDate;
  @HiveField(3)
  double? bornWeight;
  @HiveField(4)
  String? breed;
  @HiveField(5)
  double? currentWeight;
  @HiveField(6)
  double? ecc;
  @HiveField(7)
  String? identifier;
  @HiveField(8)
  String? name;
  @HiveField(9)
  double? previousWeight;
  @HiveField(10)
  String? type;
  @HiveField(11)
  int? propertyId;

  AnimalModel({
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
  });

  AnimalModel copyWith({
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
  }) {
    return AnimalModel(
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'bornDate': bornDate,
      'bornWeight': bornWeight,
      'breed': breed,
      'currentWeight': currentWeight,
      'ecc': ecc,
      'identifier': identifier,
      'name': name,
      'previousWeight': previousWeight,
      'type': type,
      'propertyId': propertyId,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      id: map['id'] != null ? map['id'] as int : null,
      bornDate: map['bornDate'] != null ? map['bornDate'] as String : null,
      bornWeight:
          map['bornWeight'] != null ? map['bornWeight'] as double : null,
      breed: map['breed'] != null ? map['breed'] as String : null,
      currentWeight:
          map['currentWeight'] != null ? map['currentWeight'] as double : null,
      ecc: map['ecc'] != null ? map['ecc'] as double : null,
      identifier:
          map['identifier'] != null ? map['identifier'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      previousWeight: map['previousWeight'] != null
          ? map['previousWeight'] as double
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      propertyId:
          map['property']['id'] != null ? map['property']['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalModel(id: $id, bornDate: $bornDate, bornWeight: $bornWeight, breed: $breed, currentWeight: $currentWeight, ecc: $ecc, identifier: $identifier, name: $name, previousWeight: $previousWeight, type: $type, propertyId: $propertyId)';
  }

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bornDate == bornDate &&
        other.bornWeight == bornWeight &&
        other.breed == breed &&
        other.currentWeight == currentWeight &&
        other.ecc == ecc &&
        other.identifier == identifier &&
        other.name == name &&
        other.previousWeight == previousWeight &&
        other.type == type &&
        other.propertyId == propertyId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bornDate.hashCode ^
        bornWeight.hashCode ^
        breed.hashCode ^
        currentWeight.hashCode ^
        ecc.hashCode ^
        identifier.hashCode ^
        name.hashCode ^
        previousWeight.hashCode ^
        type.hashCode ^
        propertyId.hashCode;
  }
}
