// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:idr_mobile/app/data/models/property_model.dart';

class PropertyCollaboratorModel {
  final int id;
  final String collaboratorName;
  final String workHours;
  final String workDays;
  final PropertyModel property;

  PropertyCollaboratorModel({
    required this.id,
    required this.collaboratorName,
    required this.workHours,
    required this.workDays,
    required this.property,
  });

  PropertyCollaboratorModel copyWith({
    int? id,
    String? collaboratorName,
    String? workHours,
    String? workDays,
    PropertyModel? property,
  }) {
    return PropertyCollaboratorModel(
      id: id ?? this.id,
      collaboratorName: collaboratorName ?? this.collaboratorName,
      workHours: workHours ?? this.workHours,
      workDays: workDays ?? this.workDays,
      property: property ?? this.property,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collaboratorName': collaboratorName,
      'workHours': workHours,
      'workDays': workDays,
      'property': property.toMap(),
    };
  }

  factory PropertyCollaboratorModel.fromMap(Map<String, dynamic> map) {
    return PropertyCollaboratorModel(
      id: map['id'] as int,
      collaboratorName: map['collaboratorName'] as String,
      workHours: map['workHours'] as String,
      workDays: map['workDays'] as String,
      property: PropertyModel.fromMap(map['property'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PropertyCollaboratorModel.fromJson(String source) =>
      PropertyCollaboratorModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PropertyCollaboratorModel(id: $id, collaboratorName: $collaboratorName, workHours: $workHours, workDays: $workDays, property: $property)';
  }

  @override
  bool operator ==(covariant PropertyCollaboratorModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.collaboratorName == collaboratorName &&
        other.workHours == workHours &&
        other.workDays == workDays &&
        other.property == property;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        collaboratorName.hashCode ^
        workHours.hashCode ^
        workDays.hashCode ^
        property.hashCode;
  }
}
