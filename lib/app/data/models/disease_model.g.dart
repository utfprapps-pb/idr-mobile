// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiseaseModelAdapter extends TypeAdapter<DiseaseModel> {
  @override
  final int typeId = 13;

  @override
  DiseaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiseaseModel()
      ..internalId = fields[1] as String?
      ..id = fields[2] as int?
      ..diseaseName = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, DiseaseModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.diseaseName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiseaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
