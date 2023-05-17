// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'insemination_model.g.dart';

@HiveType(typeId: 3)
class InseminationModel {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? bull;
  @HiveField(4)
  String? animalIdentifier;
  InseminationModel({
    this.id,
    this.date,
    this.bull,
    this.animalIdentifier,
  });

  InseminationModel copyWith({
    int? id,
    String? date,
    String? bull,
    String? animalIdentifier,
  }) {
    return InseminationModel(
      id: id ?? this.id,
      date: date ?? this.date,
      bull: bull ?? this.bull,
      animalIdentifier: animalIdentifier ?? this.animalIdentifier,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (bull != null) {
      result.addAll({'bull': bull});
    }
    if (animalIdentifier != null) {
      result.addAll({'animalIdentifier': animalIdentifier});
    }

    return result;
  }

  factory InseminationModel.fromMap(Map<String, dynamic> map) {
    return InseminationModel(
      id: map['id']?.toInt(),
      date: map['date'],
      bull: map['bull'],
      animalIdentifier: map['animalIdentifier'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InseminationModel.fromJson(String source) =>
      InseminationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InseminationModel(id: $id, date: $date, bull: $bull, animalIdentifier: $animalIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InseminationModel &&
        other.id == id &&
        other.date == date &&
        other.bull == bull &&
        other.animalIdentifier == animalIdentifier;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        bull.hashCode ^
        animalIdentifier.hashCode;
  }
}
