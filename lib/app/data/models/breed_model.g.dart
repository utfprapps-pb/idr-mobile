// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedModelAdapter extends TypeAdapter<BreedModel> {
  @override
  final int typeId = 12;

  @override
  BreedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreedModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      breedName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BreedModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.breedName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
