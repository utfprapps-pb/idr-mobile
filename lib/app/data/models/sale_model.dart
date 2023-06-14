// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'sale_model.g.dart';

@HiveType(typeId: 8)
class SaleModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? animalIdentifier;
  @HiveField(5)
  double? weight;
  @HiveField(6)
  double? value;
  @HiveField(7)
  String? destiny;
  @HiveField(8)
  String? reason;
  @HiveField(9)
  bool? isEdited;

  SaleModel({
    this.internalId,
    this.id,
    this.date,
    this.animalIdentifier,
    this.weight,
    this.value,
    this.destiny,
    this.reason,
    this.isEdited,
  });

  SaleModel copyWith({
    String? internalId,
    int? id,
    String? date,
    String? animalIdentifier,
    double? weight,
    double? value,
    String? destiny,
    String? reason,
    bool? isEdited,
  }) {
    return SaleModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      date: date ?? this.date,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      weight: weight ?? this.weight,
      value: value ?? this.value,
      destiny: destiny ?? this.destiny,
      reason: reason ?? this.reason,
      isEdited: isEdited ?? this.isEdited,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (date != null) {
      DateTime convertToDateTime = DateFormat("dd/MM/yyy").parse(date!);
      String formatted = DateFormat("yyyy-MM-dd").format(convertToDateTime);

      result.addAll({'dateSale': formatted});
    }
    if (animalIdentifier != null) {
      result.addAll({
        'animal': {'identifier': animalIdentifier}
      });
    }
    if (weight != null) {
      result.addAll({'weight': weight});
    }
    if (value != null) {
      result.addAll({'value': value});
    }
    if (destiny != null) {
      result.addAll({'destination': destiny});
    }
    if (reason != null) {
      result.addAll({'reason': reason});
    }

    return result;
  }

  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      id: map['id']?.toInt(),
      date: map['dateSale'],
      animalIdentifier: map['animal']['identifier'],
      weight: map['weight']?.toDouble(),
      value: map['value']?.toDouble(),
      destiny: map['destination'],
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleModel.fromJson(String source) =>
      SaleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SaleModel(internalId: $internalId, id: $id, date: $date, animalIdentifier: $animalIdentifier, weight: $weight, value: $value, destiny: $destiny, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SaleModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.date == date &&
        other.animalIdentifier == animalIdentifier &&
        other.weight == weight &&
        other.value == value &&
        other.destiny == destiny &&
        other.isEdited == isEdited &&
        other.reason == reason;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        date.hashCode ^
        animalIdentifier.hashCode ^
        weight.hashCode ^
        value.hashCode ^
        destiny.hashCode ^
        isEdited.hashCode ^
        reason.hashCode;
  }
}
