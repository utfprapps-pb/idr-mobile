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
      infestationType: fields[3] as String?,
      date: fields[4] as String?,
      idProperty: fields[5] as int?,
      idCulture: fields[6] as int?,
      idDisease: fields[7] as int?,
      isEdited: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, VegetableDiseaseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.infestationType)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.idProperty)
      ..writeByte(6)
      ..write(obj.idCulture)
      ..writeByte(7)
      ..write(obj.idDisease)
      ..writeByte(8)
      ..write(obj.isEdited);
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
