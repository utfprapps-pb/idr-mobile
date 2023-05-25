// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'purchase_model.g.dart';

@HiveType(typeId: 9)
class PurchaseModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? datePurchase;
  @HiveField(4)
  String? animalIdentifier;
  @HiveField(5)
  String? dateBirth;
  @HiveField(6)
  double? weight;
  @HiveField(7)
  double? value;

  PurchaseModel({
    this.internalId,
    this.id,
    this.datePurchase,
    this.animalIdentifier,
    this.dateBirth,
    this.weight,
    this.value,
  });

  PurchaseModel copyWith({
    String? internalId,
    int? id,
    String? datePurchase,
    String? animalIdentifier,
    String? dateBirth,
    double? weight,
    double? value,
  }) {
    return PurchaseModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      datePurchase: datePurchase ?? this.datePurchase,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      dateBirth: dateBirth ?? this.dateBirth,
      weight: weight ?? this.weight,
      value: value ?? this.value,
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
    if (datePurchase != null) {
      result.addAll({'datePurchase': datePurchase});
    }
    if (animalIdentifier != null) {
      result.addAll({'animalIdentifier': animalIdentifier});
    }
    if (dateBirth != null) {
      result.addAll({'dateBirth': dateBirth});
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (value != null) {
      result.addAll({'value': value});
    }

    return result;
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      datePurchase: map['datePurchase'],
      animalIdentifier: map['animalIdentifier'],
      dateBirth: map['dateBirth'],
      weight: map['weight']?.toDouble(),
      value: map['value']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseModel.fromJson(String source) =>
      PurchaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchaseModel(internalId: $internalId, id: $id, datePurchase: $datePurchase, animalIdentifier: $animalIdentifier, dateBirth: $dateBirth, weight: $weight, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.datePurchase == datePurchase &&
        other.animalIdentifier == animalIdentifier &&
        other.dateBirth == dateBirth &&
        other.weight == weight &&
        other.value == value;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        datePurchase.hashCode ^
        animalIdentifier.hashCode ^
        dateBirth.hashCode ^
        weight.hashCode ^
        value.hashCode;
  }
}
