// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insemination_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InseminationModelAdapter extends TypeAdapter<InseminationModel> {
  @override
  final int typeId = 3;

  @override
  InseminationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InseminationModel(
      id: fields[1] as int?,
      date: fields[2] as String?,
      bull: fields[3] as String?,
      animalIdentifier: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InseminationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.bull)
      ..writeByte(4)
      ..write(obj.animalIdentifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InseminationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
