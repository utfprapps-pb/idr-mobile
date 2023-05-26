// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CultureModelAdapter extends TypeAdapter<CultureModel> {
  @override
  final int typeId = 15;

  @override
  CultureModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CultureModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      cultureName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CultureModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.cultureName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CultureModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
