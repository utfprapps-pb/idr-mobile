// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'animal_model.g.dart';

@HiveType(typeId: 1)
class AnimalModel {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String bornDate;
  @HiveField(3)
  final double? bornWeight;
  @HiveField(4)
  final String breed;
  @HiveField(5)
  final double? currentWeight;
  @HiveField(6)
  final double? ecc;
  @HiveField(7)
  final String? identifier;
  @HiveField(8)
  final String name;
  @HiveField(9)
  final double? previousWeight;
  @HiveField(10)
  final String? type;
  AnimalModel({
    required this.id,
    required this.bornDate,
    this.bornWeight,
    required this.breed,
    this.currentWeight,
    this.ecc,
    this.identifier,
    required this.name,
    this.previousWeight,
    this.type,
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
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      id: map['id'] as int,
      bornDate: map['bornDate'] as String,
      bornWeight:
          map['bornWeight'] != null ? map['bornWeight'] as double : null,
      breed: map['breed'] as String,
      currentWeight:
          map['currentWeight'] != null ? map['currentWeight'] as double : null,
      ecc: map['ecc'] != null ? map['ecc'] as double : null,
      identifier:
          map['identifier'] != null ? map['identifier'] as String : null,
      name: map['name'] as String,
      previousWeight: map['previousWeight'] != null
          ? map['previousWeight'] as double
          : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) =>
      AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimalModel(id: $id, bornDate: $bornDate, bornWeight: $bornWeight, breed: $breed, currentWeight: $currentWeight, ecc: $ecc, identifier: $identifier, name: $name, previousWeight: $previousWeight, type: $type)';
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
        other.type == type;
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
        type.hashCode;
  }
}
