// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:idr_mobile/core/utils/functions/dateformatt.dart';
import 'package:intl/intl.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'insemination_model.g.dart';

@HiveType(typeId: 3)
class InseminationModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? bull;
  @HiveField(5)
  String? animalIdentifier;
  @HiveField(6)
  bool? isEdited;

  InseminationModel({
    this.internalId,
    this.id,
    this.date,
    this.bull,
    this.animalIdentifier,
    this.isEdited,
  });

  InseminationModel copyWith({
    String? internalId,
    int? id,
    String? date,
    String? bull,
    String? animalIdentifier,
    bool? isEdited,
  }) {
    return InseminationModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      date: date ?? this.date,
      bull: bull ?? this.bull,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
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
    if (bull != null) {
      result.addAll({'bull': bull});
    }
    if (animalIdentifier != null) {
      result.addAll({
        'animal': {'identifier': animalIdentifier}
      });
    }

    return result;
  }

  factory InseminationModel.fromMap(Map<String, dynamic> map) {
    String? dateFormatted;
    if (map['date'] != null) {
      dateFormatted = dateFormat
          .format(DateTime.tryParse(map['date'].toString()) ?? DateTime.now())
          .toString();
    }

    return InseminationModel(
      id: map['id']?.toInt(),
      date: dateFormatted,
      bull: map['bull'],
      animalIdentifier: map['animalIdentifier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InseminationModel.fromJson(String source) =>
      InseminationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InseminationModel(internalId: $internalId, id: $id, date: $date, bull: $bull, animalIdentifier: $animalIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InseminationModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.date == date &&
        other.bull == bull &&
        other.animalIdentifier == animalIdentifier;
  }

  @override
  int get hashCode {
    return internalId.hashCode ^
        id.hashCode ^
        date.hashCode ^
        bull.hashCode ^
        animalIdentifier.hashCode;
  }
}
