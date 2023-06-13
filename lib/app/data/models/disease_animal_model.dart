import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:intl/intl.dart';

part 'disease_animal_model.g.dart';

@HiveType(typeId: 5)
class DiseaseAnimalModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? internalId;
  @HiveField(3)
  String? animalIdentifier;
  @HiveField(4)
  String? dateDiagnostic;
  @HiveField(5)
  String? diagnostic;
  @HiveField(6)
  bool? isEdited;

  DiseaseAnimalModel({
    this.id,
    this.internalId,
    this.animalIdentifier,
    this.dateDiagnostic,
    this.diagnostic,
    this.isEdited,
  });

  DiseaseAnimalModel copyWith({
    int? id,
    String? internalId,
    String? animalIdentifier,
    String? dateDiagnostic,
    String? diagnostic,
    bool? isEdited,
  }) {
    return DiseaseAnimalModel(
      id: id ?? this.id,
      internalId: internalId ?? this.internalId,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      dateDiagnostic: dateDiagnostic ?? this.dateDiagnostic,
      diagnostic: diagnostic ?? this.diagnostic,
      isEdited: isEdited ?? this.isEdited,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (animalIdentifier != null) {
      result.addAll({
        'animal': {'identifier': animalIdentifier}
      });
    }
    if (dateDiagnostic != null) {
      DateTime convertToDateTime =
          DateFormat("dd/MM/yyy").parse(dateDiagnostic!);
      String formatted = DateFormat("yyyy-MM-dd").format(convertToDateTime);

      result.addAll({'diagnosisDate': formatted});
    }
    if (diagnostic != null) {
      result.addAll({'diagnosis': diagnostic});
    }

    return result;
  }

  factory DiseaseAnimalModel.fromMap(Map<String, dynamic> map) {
    return DiseaseAnimalModel(
      id: map['id']?.toInt(),
      animalIdentifier: map['animal']['identifier'],
      dateDiagnostic: map['diagnosisDate'],
      diagnostic: map['diagnosis'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseAnimalModel.fromJson(String source) =>
      DiseaseAnimalModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DiseaseAnimalModel(id: $id, internalId: $internalId, animalIdentifier: $animalIdentifier, dateDiagnostic: $dateDiagnostic, diagnostic: $diagnostic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiseaseAnimalModel &&
        other.id == id &&
        other.internalId == internalId &&
        other.animalIdentifier == animalIdentifier &&
        other.dateDiagnostic == dateDiagnostic &&
        other.diagnostic == diagnostic &&
        other.isEdited == isEdited;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        internalId.hashCode ^
        animalIdentifier.hashCode ^
        dateDiagnostic.hashCode ^
        diagnostic.hashCode ^
        isEdited.hashCode;
  }
}
