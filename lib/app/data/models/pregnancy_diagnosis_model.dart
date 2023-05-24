// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pregnancy_diagnosis_model.g.dart';

@HiveType(typeId: 7)
class PregnancyDiagnosisModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? animalIdentifier;
  @HiveField(5)
  String? dateLastInsemination;

  PregnancyDiagnosisModel({
    this.internalId,
    this.id,
    this.date,
    this.animalIdentifier,
    this.dateLastInsemination,
  });

  PregnancyDiagnosisModel copyWith({
    String? internalId,
    int? id,
    String? date,
    String? animalIdentifier,
    String? dateLastInsemination,
  }) {
    return PregnancyDiagnosisModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      date: date ?? this.date,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      dateLastInsemination: dateLastInsemination ?? this.dateLastInsemination,
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
    if (date != null) {
      result.addAll({'date': date});
    }
    if (animalIdentifier != null) {
      result.addAll({'animalIdentifier': animalIdentifier});
    }
    if (dateLastInsemination != null) {
      result.addAll({'dateLastInsemination': dateLastInsemination});
    }

    return result;
  }

  factory PregnancyDiagnosisModel.fromMap(Map<String, dynamic> map) {
    return PregnancyDiagnosisModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      date: map['date'],
      animalIdentifier: map['animalIdentifier'],
      dateLastInsemination: map['dateLastInsemination'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PregnancyDiagnosisModel.fromJson(String source) =>
      PregnancyDiagnosisModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PregnancyDiagnosisModel(internalId: $internalId, id: $id, date: $date, animalIdentifier: $animalIdentifier, dateLastInsemination: $dateLastInsemination)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PregnancyDiagnosisModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.date == date &&
        other.animalIdentifier == animalIdentifier &&
        other.dateLastInsemination == dateLastInsemination;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        date.hashCode ^
        animalIdentifier.hashCode ^
        dateLastInsemination.hashCode;
  }
}
