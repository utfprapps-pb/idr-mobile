// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastitis_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastitisModelAdapter extends TypeAdapter<MastitisModel> {
  @override
  final int typeId = 4;

  @override
  MastitisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastitisModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      animalIdentifier: fields[3] as String?,
      ad: fields[4] as String?,
      ae: fields[5] as String?,
      pd: fields[6] as String?,
      pe: fields[7] as String?,
      dateDiagnostic: fields[8] as String?,
      type: fields[9] as String?,
      isEdited: fields[10] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MastitisModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.ad)
      ..writeByte(5)
      ..write(obj.ae)
      ..writeByte(6)
      ..write(obj.pd)
      ..writeByte(7)
      ..write(obj.pe)
      ..writeByte(8)
      ..write(obj.dateDiagnostic)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.isEdited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastitisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
