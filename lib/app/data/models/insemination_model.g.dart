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
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      date: fields[3] as String?,
      bull: fields[4] as String?,
      animalIdentifier: fields[5] as String?,
      isEdited: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, InseminationModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.bull)
      ..writeByte(5)
      ..write(obj.animalIdentifier)
      ..writeByte(6)
      ..write(obj.isEdited);
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
