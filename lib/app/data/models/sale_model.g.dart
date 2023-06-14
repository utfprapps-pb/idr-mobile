// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleModelAdapter extends TypeAdapter<SaleModel> {
  @override
  final int typeId = 8;

  @override
  SaleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      date: fields[3] as String?,
      animalIdentifier: fields[4] as String?,
      weight: fields[5] as double?,
      value: fields[6] as double?,
      destiny: fields[7] as String?,
      reason: fields[8] as String?,
      isEdited: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SaleModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.animalIdentifier)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.value)
      ..writeByte(7)
      ..write(obj.destiny)
      ..writeByte(8)
      ..write(obj.reason)
      ..writeByte(9)
      ..write(obj.isEdited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
