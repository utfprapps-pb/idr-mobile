// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'culture_model.g.dart';

@HiveType(typeId: 15)
class CultureModel {
  @HiveField(1)
  String? internalId;
  @HiveField(2)
  int? id;
  @HiveField(3)
  String? cultureName;

  CultureModel({
    this.internalId,
    this.id,
    this.cultureName,
  });

  CultureModel copyWith({
    String? internalId,
    int? id,
    String? cultureName,
  }) {
    return CultureModel(
      internalId: internalId ?? this.internalId,
      id: id ?? this.id,
      cultureName: cultureName ?? this.cultureName,
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
    if (cultureName != null) {
      result.addAll({'cultureName': cultureName});
    }

    return result;
  }

  factory CultureModel.fromMap(Map<String, dynamic> map) {
    return CultureModel(
      internalId: map['internalId'],
      id: map['id']?.toInt(),
      cultureName: map['cultureName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CultureModel.fromJson(String source) =>
      CultureModel.fromMap(json.decode(source));

  @override
  String toString() => '$id - $cultureName';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CultureModel &&
        other.internalId == internalId &&
        other.id == id &&
        other.cultureName == cultureName;
  }

  @override
  int get hashCode => internalId.hashCode ^ id.hashCode ^ cultureName.hashCode;
}
