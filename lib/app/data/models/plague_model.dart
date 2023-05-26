// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'plague_model.g.dart';

@HiveType(typeId: 14)
class PlagueModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? plagueName;

  PlagueModel({
    this.internalId,
    this.id,
    this.plagueName,
  });

  PlagueModel copyWith({
    String? internalId,
    int? id,
    String? plagueName,
  }) {
    return PlagueModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      plagueName: plagueName ?? this.plagueName,
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
    if (plagueName != null) {
      result.addAll({'plagueName': plagueName});
    }

    return result;
  }

  factory PlagueModel.fromMap(Map<String, dynamic> map) {
    return PlagueModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      plagueName: map['plagueName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlagueModel.fromJson(String source) =>
      PlagueModel.fromMap(json.decode(source));

  @override
  String toString() => '$id - $plagueName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlagueModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.plagueName == plagueName;
  }

  @override
  int get hashCode => internalId.hashCode ^ id.hashCode ^ plagueName.hashCode;
}
