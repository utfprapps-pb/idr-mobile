// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vegetable_plague_model.g.dart';

@HiveType(typeId: 16)
class VegetablePlagueModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? infestationType;
  @HiveField(4)
  String? date;
  @HiveField(5)
  int? idProperty;
  @HiveField(6)
  int? idCulture;
  @HiveField(7)
  int? idPlague;

  VegetablePlagueModel({
    this.internalId,
    this.id,
    this.infestationType,
    this.date,
    this.idProperty,
    this.idCulture,
    this.idPlague,
  });

  VegetablePlagueModel copyWith({
    String? internalId,
    int? id,
    String? infestationType,
    String? date,
    int? idProperty,
    int? idCulture,
    int? idPlague,
  }) {
    return VegetablePlagueModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      infestationType: infestationType ?? this.infestationType,
      date: date ?? this.date,
      idProperty: idProperty ?? this.idProperty,
      idCulture: idCulture ?? this.idCulture,
      idPlague: idPlague ?? this.idPlague,
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
    if (infestationType != null) {
      result.addAll({'infestationType': infestationType});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (idProperty != null) {
      result.addAll({'idProperty': idProperty});
    }
    if (idCulture != null) {
      result.addAll({'idCulture': idCulture});
    }
    if (idPlague != null) {
      result.addAll({'idPlague': idPlague});
    }

    return result;
  }

  factory VegetablePlagueModel.fromMap(Map<String, dynamic> map) {
    return VegetablePlagueModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      infestationType: map['infestationType'],
      date: map['date'],
      idProperty: map['property']['id']?.toInt(),
      idCulture: map['culture']['id']?.toInt(),
      idPlague: map['plague']['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory VegetablePlagueModel.fromJson(String source) =>
      VegetablePlagueModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$id - $infestationType';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VegetablePlagueModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.infestationType == infestationType &&
        other.date == date &&
        other.idProperty == idProperty &&
        other.idCulture == idCulture &&
        other.idPlague == idPlague;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        infestationType.hashCode ^
        date.hashCode ^
        idProperty.hashCode ^
        idCulture.hashCode ^
        idPlague.hashCode;
  }
}
