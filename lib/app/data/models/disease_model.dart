import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 5)
class DiseaseModel {
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? internalId;
  @HiveField(3)
  String? animalIdentifier;
  @HiveField(4)
  String? dateDiagnostic;
  @HiveField(5)
  String? diagnostic;

  DiseaseModel({
    this.id,
    this.internalId,
    this.animalIdentifier,
    this.dateDiagnostic,
    this.diagnostic,
  });

  DiseaseModel copyWith({
    String? id,
    String? internalId,
    String? animalIdentifier,
    String? dateDiagnostic,
    String? diagnostic,
  }) {
    return DiseaseModel(
      id: id ?? this.id,
      internalId: internalId ?? this.internalId,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      dateDiagnostic: dateDiagnostic ?? this.dateDiagnostic,
      diagnostic: diagnostic ?? this.diagnostic,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (internalId != null) {
      result.addAll({'internalId': internalId});
    }
    if (animalIdentifier != null) {
      result.addAll({'animalIdentifier': animalIdentifier});
    }
    if (dateDiagnostic != null) {
      result.addAll({'dateDiagnostic': dateDiagnostic});
    }
    if (diagnostic != null) {
      result.addAll({'diagnostic': diagnostic});
    }

    return result;
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      id: map['id'],
      internalId: map['internalId'],
      animalIdentifier: map['animalIdentifier'],
      dateDiagnostic: map['dateDiagnostic'],
      diagnostic: map['diagnostic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) =>
      DiseaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DiseaseModel(id: $id, internalId: $internalId, animalIdentifier: $animalIdentifier, dateDiagnostic: $dateDiagnostic, diagnostic: $diagnostic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiseaseModel &&
        other.id == id &&
        other.internalId == internalId &&
        other.animalIdentifier == animalIdentifier &&
        other.dateDiagnostic == dateDiagnostic &&
        other.diagnostic == diagnostic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        internalId.hashCode ^
        animalIdentifier.hashCode ^
        dateDiagnostic.hashCode ^
        diagnostic.hashCode;
  }
}
