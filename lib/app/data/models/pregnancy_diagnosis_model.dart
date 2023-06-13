// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
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
  @HiveField(6)
  bool? isEdited;

  PregnancyDiagnosisModel({
    this.internalId,
    this.id,
    this.date,
    this.animalIdentifier,
    this.dateLastInsemination,
    this.isEdited,
  });

  PregnancyDiagnosisModel copyWith({
    String? internalId,
    int? id,
    String? date,
    String? animalIdentifier,
    String? dateLastInsemination,
    bool? isEdited,
  }) {
    return PregnancyDiagnosisModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      date: date ?? this.date,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      dateLastInsemination: dateLastInsemination ?? this.dateLastInsemination,
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

      result.addAll({'date': formatted});
    }
    if (animalIdentifier != null) {
      result.addAll({
        'animal': {'identifier': animalIdentifier}
      });
    }
    if (dateLastInsemination != null) {
      DateTime convertToDateTime =
          DateFormat("dd/MM/yyy").parse(dateLastInsemination!);
      String formatted = DateFormat("yyyy-MM-dd").format(convertToDateTime);

      result.addAll({'dateLastInsemination': formatted});
    }

    return result;
  }

  factory PregnancyDiagnosisModel.fromMap(Map<String, dynamic> map) {
    return PregnancyDiagnosisModel(
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
        other.isEdited == isEdited &&
        other.dateLastInsemination == dateLastInsemination;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        date.hashCode ^
        animalIdentifier.hashCode ^
        isEdited.hashCode ^
        dateLastInsemination.hashCode;
  }
}
