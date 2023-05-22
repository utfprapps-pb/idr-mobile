// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiseaseModelAdapter extends TypeAdapter<DiseaseModel> {
  @override
  final int typeId = 5;

  @override
  DiseaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiseaseModel(
      id: fields[1] as String?,
      internalId: fields[2] as String?,
      animalIdentifier: fields[3] as String?,
      dateDiagnostic: fields[4] as String?,
      diagnostic: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DiseaseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.internalId)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.dateDiagnostic)
      ..writeByte(5)
      ..write(obj.diagnostic);
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
