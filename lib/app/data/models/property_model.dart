// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'property_model.g.dart';

@HiveType(typeId: 0)
class PropertyModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? ocupationArea;
  @HiveField(2)
  final double? totalArea;
  @HiveField(3)
  final int? latitude;
  @HiveField(4)
  final int? longitude;
  @HiveField(5)
  final bool? leased;

  PropertyModel({
    this.id,
    this.ocupationArea,
    this.totalArea,
    this.latitude,
    this.longitude,
    this.leased,
  });

  String getNamed() {
    return "Propriedade $id";
  }

  PropertyModel copyWith({
    int? id,
    String? ocupationArea,
    double? totalArea,
    int? latitude,
    int? longitude,
    bool? leased,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      ocupationArea: ocupationArea ?? this.ocupationArea,
      totalArea: totalArea ?? this.totalArea,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      leased: leased ?? this.leased,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ocupationArea': ocupationArea,
      'totalArea': totalArea,
      'latitude': latitude,
      'longitude': longitude,
      'leased': leased,
    };
  }

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id'] as int,
      ocupationArea: map['ocupationArea'] as String,
      totalArea: map['totalArea'] != null ? map['totalArea'] as double : null,
      latitude: map['latitude'] != null ? map['latitude'] as int : null,
      longitude: map['longitude'] != null ? map['longitude'] as int : null,
      leased: map['leased'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyModel.fromJson(String source) =>
      PropertyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyModel(id: $id, ocupationArea: $ocupationArea, totalArea: $totalArea, latitude: $latitude, longitude: $longitude, leased: $leased)';
  }

  @override
  bool operator ==(covariant PropertyModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ocupationArea == ocupationArea &&
        other.totalArea == totalArea &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.leased == leased;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ocupationArea.hashCode ^
        totalArea.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        leased.hashCode;
  }
}
