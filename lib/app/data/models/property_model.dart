// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PropertyModel {
  final int id;
  final String ocupationArea;
  final double totalArea;
  final int latitude;
  final int longitude;
  final bool leased;

  PropertyModel({
    required this.id,
    required this.ocupationArea,
    required this.totalArea,
    required this.latitude,
    required this.longitude,
    required this.leased,
  });

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
      totalArea: map['totalArea'] as double,
      latitude: map['latitude'] as int,
      longitude: map['longitude'] as int,
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
