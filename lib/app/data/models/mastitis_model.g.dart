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
      resultCmt: fields[4] as String?,
      ad: fields[5] as String?,
      ae: fields[6] as String?,
      pd: fields[7] as String?,
      pe: fields[8] as String?,
      dateDiagnostic: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastitisModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.resultCmt)
      ..writeByte(5)
      ..write(obj.ad)
      ..writeByte(6)
      ..write(obj.ae)
      ..writeByte(7)
      ..write(obj.pd)
      ..writeByte(8)
      ..write(obj.pe)
      ..writeByte(9)
      ..write(obj.dateDiagnostic);
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
