// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';
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
  @HiveField(8)
  bool? isEdited;

  VegetablePlagueModel({
    this.internalId,
    this.id,
    this.infestationType,
    this.date,
    this.idProperty,
    this.idCulture,
    this.idPlague,
    this.isEdited,
  });

  VegetablePlagueModel copyWith({
    String? internalId,
    int? id,
    String? infestationType,
    String? date,
    int? idProperty,
    int? idCulture,
    int? idPlague,
    bool? isEdited,
  }) {
    return VegetablePlagueModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      infestationType: infestationType ?? this.infestationType,
      date: date ?? this.date,
      idProperty: idProperty ?? this.idProperty,
      idCulture: idCulture ?? this.idCulture,
      idPlague: idPlague ?? this.idPlague,
      isEdited: isEdited ?? this.isEdited,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (infestationType != null) {
      result.addAll({'infestationType': infestationType});
    }
    if (date != null) {
      DateTime convertToDateTime = DateFormat("dd/MM/yyy").parse(date!);
      String formatted = DateFormat("yyyy-MM-dd").format(convertToDateTime);

      result.addAll({'date': formatted});
    }
    if (idProperty != null) {
      result.addAll({
        'property': {'id': idProperty}
      });
    }
    if (idCulture != null) {
      result.addAll({
        'culture': {'id': idCulture}
      });
    }
    if (idPlague != null) {
      result.addAll({
        'plague': {'id': idPlague}
      });
    }

    return result;
  }

  factory VegetablePlagueModel.fromMap(Map<String, dynamic> map) {
    return VegetablePlagueModel(
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
        other.isEdited == isEdited &&
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
        isEdited.hashCode ^
        idPlague.hashCode;
  }
}
