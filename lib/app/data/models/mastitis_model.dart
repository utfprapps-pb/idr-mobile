import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'mastitis_model.g.dart';

@HiveType(typeId: 4)
class MastitisModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? animalIdentifier;
  @HiveField(4)
  String? resultCmt;
  @HiveField(5)
  String? ad;
  @HiveField(6)
  String? ae;
  @HiveField(7)
  String? pd;
  @HiveField(8)
  String? pe;
  @HiveField(9)
  String? dateDiagnostic;

  MastitisModel({
    this.internalId,
    this.id,
    this.animalIdentifier,
    this.resultCmt,
    this.ad,
    this.ae,
    this.pd,
    this.pe,
    this.dateDiagnostic,
  });

  MastitisModel copyWith({
    String? internalId,
    int? id,
    String? animalIdentifier,
    String? resultCmt,
    String? ad,
    String? ae,
    String? pd,
    String? pe,
    String? dateDiagnostic,
  }) {
    return MastitisModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      resultCmt: resultCmt ?? this.resultCmt,
      ad: ad ?? this.ad,
      ae: ae ?? this.ae,
      pd: pd ?? this.pd,
      pe: pe ?? this.pe,
      dateDiagnostic: dateDiagnostic ?? this.dateDiagnostic,
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
    if (resultCmt != null) {
      result.addAll({'resultCmt': resultCmt});
    }
    if (ad != null) {
      result.addAll({'ad': ad});
    }
    if (ae != null) {
      result.addAll({'ae': ae});
    }
    if (pd != null) {
      result.addAll({'pd': pd});
    }
    if (pe != null) {
      result.addAll({'pe': pe});
    }
    if (dateDiagnostic != null) {
      result.addAll({'dateDiagnostic': dateDiagnostic});
    }

    return result;
  }

  factory MastitisModel.fromMap(Map<String, dynamic> map) {
    return MastitisModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      animalIdentifier: map['animalIdentifier'],
      resultCmt: map['resultCmt'],
      ad: map['ad'],
      ae: map['ae'],
      pd: map['pd'],
      pe: map['pe'],
      dateDiagnostic: map['dateDiagnostic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MastitisModel.fromJson(String source) =>
      MastitisModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MastitisModel(internalId: $internalId, id: $id, animalIdentifier: $animalIdentifier, resultCmt: $resultCmt, ad: $ad, ae: $ae, pd: $pd, pe: $pe, dateDiagnostic: $dateDiagnostic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MastitisModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.animalIdentifier == animalIdentifier &&
        other.resultCmt == resultCmt &&
        other.ad == ad &&
        other.ae == ae &&
        other.pd == pd &&
        other.pe == pe &&
        other.dateDiagnostic == dateDiagnostic;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        animalIdentifier.hashCode ^
        resultCmt.hashCode ^
        ad.hashCode ^
        ae.hashCode ^
        pd.hashCode ^
        pe.hashCode ^
        dateDiagnostic.hashCode;
  }
}
