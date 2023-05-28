// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetable_plague_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VegetablePlagueModelAdapter extends TypeAdapter<VegetablePlagueModel> {
  @override
  final int typeId = 16;

  @override
  VegetablePlagueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VegetablePlagueModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      infestationType: fields[3] as String?,
      date: fields[4] as String?,
      idProperty: fields[5] as int?,
      idCulture: fields[6] as int?,
      idPlague: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, VegetablePlagueModel obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.idPlague);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VegetablePlagueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
