// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 6)
class MedicationModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? animalIdentifier;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? activePrinciple;
  @HiveField(6)
  String? name;
  @HiveField(7)
  String? dose;
  @HiveField(8)
  String? applicationType;

  MedicationModel({
    this.internalId,
    this.id,
    this.animalIdentifier,
    this.date,
    this.activePrinciple,
    this.name,
    this.dose,
    this.applicationType,
  });

  MedicationModel copyWith({
    String? internalId,
    int? id,
    String? animalIdentifier,
    String? date,
    String? activePrinciple,
    String? name,
    String? dose,
    String? applicationType,
  }) {
    return MedicationModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      date: date ?? this.date,
      activePrinciple: activePrinciple ?? this.activePrinciple,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      applicationType: applicationType ?? this.applicationType,
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
    if (animalIdentifier != null) {
      result.addAll({'animalIdentifier': animalIdentifier});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (activePrinciple != null) {
      result.addAll({'activePrinciple': activePrinciple});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (dose != null) {
      result.addAll({'dose': dose});
    }
    if (applicationType != null) {
      result.addAll({'applicationType': applicationType});
    }

    return result;
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      animalIdentifier: map['animalIdentifier'],
      date: map['date'],
      activePrinciple: map['activePrinciple'],
      name: map['name'],
      dose: map['dose'],
      applicationType: map['applicationType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) =>
      MedicationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MedicationModel(internalId: $internalId, id: $id, animalIdentifier: $animalIdentifier, date: $date, activePrinciple: $activePrinciple, name: $name, dose: $dose, applicationType: $applicationType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MedicationModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.animalIdentifier == animalIdentifier &&
        other.date == date &&
        other.activePrinciple == activePrinciple &&
        other.name == name &&
        other.dose == dose &&
        other.applicationType == applicationType;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        animalIdentifier.hashCode ^
        date.hashCode ^
        activePrinciple.hashCode ^
        name.hashCode ^
        dose.hashCode ^
        applicationType.hashCode;
  }
}
