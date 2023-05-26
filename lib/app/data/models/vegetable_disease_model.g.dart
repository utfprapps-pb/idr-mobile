// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable_disease_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VegetableDiseaseModelAdapter extends TypeAdapter<VegetableDiseaseModel> {
  @override
  final int typeId = 11;

  @override
  VegetableDiseaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VegetableDiseaseModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      typeInfection: fields[3] as String?,
      culture: fields[4] as String?,
      diseaseIdentification: fields[5] as String?,
      vegetableIdentifier: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VegetableDiseaseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.typeInfection)
      ..writeByte(4)
      ..write(obj.culture)
      ..writeByte(5)
      ..write(obj.diseaseIdentification)
      ..writeByte(6)
      ..write(obj.vegetableIdentifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VegetableDiseaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
