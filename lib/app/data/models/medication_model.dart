// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart';

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
  String? applicationDate;
  @HiveField(5)
  String? activePrinciple;
  @HiveField(6)
  String? appliedDose;
  @HiveField(7)
  String? applicationWay;
  @HiveField(8)
  int? idProduct;
  @HiveField(9)
  bool? isEdited;

  MedicationModel({
    this.internalId,
    this.id,
    this.animalIdentifier,
    this.applicationDate,
    this.activePrinciple,
    this.appliedDose,
    this.applicationWay,
    this.idProduct,
    this.isEdited,
  });

  MedicationModel copyWith({
    String? internalId,
    int? id,
    String? animalIdentifier,
    String? applicationDate,
    String? activePrinciple,
    String? appliedDose,
    String? applicationWay,
    int? idProduct,
    bool? isEdited,
  }) {
    return MedicationModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
      applicationDate: applicationDate ?? this.applicationDate,
      activePrinciple: activePrinciple ?? this.activePrinciple,
      appliedDose: appliedDose ?? this.appliedDose,
      applicationWay: applicationWay ?? this.applicationWay,
      idProduct: idProduct ?? this.idProduct,
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
    if (applicationDate != null) {
      DateTime convertToDateTime =
          DateFormat("dd/MM/yyy").parse(applicationDate!);
      String formatted = DateFormat("yyyy-MM-dd").format(convertToDateTime);

      result.addAll({'applicationDate': formatted});
    }
    if (activePrinciple != null) {
      result.addAll({'activePrinciple': activePrinciple});
    }
    if (appliedDose != null) {
      result.addAll({'appliedDose': appliedDose});
    }
    if (applicationWay != null) {
      result.addAll({'applicationWay': applicationWay});
    }
    if (idProduct != null) {
      result.addAll({
        'product': {'id': idProduct}
      });
    }

    return result;
  }

  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      animalIdentifier: map['animal']['animalIdentifier'],
      applicationDate: map['date'],
      activePrinciple: map['activePrinciple'],
      appliedDose: map['appliedDose'],
      applicationWay: map['applicationWay'],
      idProduct: map['product']['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicationModel.fromJson(String source) =>
      MedicationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$id - $applicationDate, $activePrinciple';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MedicationModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.animalIdentifier == animalIdentifier &&
        other.applicationDate == applicationDate &&
        other.activePrinciple == activePrinciple &&
        other.appliedDose == appliedDose &&
        other.applicationWay == applicationWay &&
        other.isEdited == isEdited &&
        other.idProduct == idProduct;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        animalIdentifier.hashCode ^
        applicationDate.hashCode ^
        activePrinciple.hashCode ^
        appliedDose.hashCode ^
        applicationWay.hashCode ^
        isEdited.hashCode ^
        idProduct.hashCode;
  }
}
