// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plague_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlagueModelAdapter extends TypeAdapter<PlagueModel> {
  @override
  final int typeId = 14;

  @override
  PlagueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlagueModel()
      ..internalId = fields[1] as String?
      ..id = fields[2] as int?
      ..plagueName = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, PlagueModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.plagueName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlagueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
