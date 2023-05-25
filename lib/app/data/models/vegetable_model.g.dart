// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VegetableModelAdapter extends TypeAdapter<VegetableModel> {
  @override
  final int typeId = 10;

  @override
  VegetableModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VegetableModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      name: fields[3] as String?,
      propertyId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, VegetableModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.propertyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VegetableModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
