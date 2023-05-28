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
  String? ad;
  @HiveField(5)
  String? ae;
  @HiveField(6)
  String? pd;
  @HiveField(7)
  String? pe;
  @HiveField(8)
  String? dateDiagnostic;
  @HiveField(9)
  String? type;

  MastitisModel({
    this.internalId,
    this.id,
    this.animalIdentifier,
    this.ad,
    this.ae,
    this.pd,
    this.pe,
    this.dateDiagnostic,
    this.type,
  });

  MastitisModel copyWith({
    String? internalId,
    int? id,
    String? animalIdentifier,
    String? ad,
    String? ae,
    String? pd,
    String? pe,
    String? dateDiagnostic,
    String? type,
  }) {
    return MastitisModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      ad: ad ?? this.ad,
      ae: ae ?? this.ae,
      pd: pd ?? this.pd,
      pe: pe ?? this.pe,
      dateDiagnostic: dateDiagnostic ?? this.dateDiagnostic,
      type: type ?? this.type,
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
    if (type != null) {
      result.addAll({'type': type});
    }

    return result;
  }

  factory MastitisModel.fromMap(Map<String, dynamic> map) {
    return MastitisModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      animalIdentifier: map['animalIdentifier'],
      ad: map['ad'],
      ae: map['ae'],
      pd: map['pd'],
      pe: map['pe'],
      dateDiagnostic: map['dateDiagnostic'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MastitisModel.fromJson(String source) =>
      MastitisModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MastitisModel(internalId: $internalId, id: $id, animalIdentifier: $animalIdentifier, ad: $ad, ae: $ae, pd: $pd, pe: $pe, dateDiagnostic: $dateDiagnostic, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MastitisModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.animalIdentifier == animalIdentifier &&
        other.ad == ad &&
        other.ae == ae &&
        other.pd == pd &&
        other.pe == pe &&
        other.dateDiagnostic == dateDiagnostic &&
        other.type == type;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        animalIdentifier.hashCode ^
        ad.hashCode ^
        ae.hashCode ^
        pd.hashCode ^
        pe.hashCode ^
        dateDiagnostic.hashCode ^
        type.hashCode;
  }
}
