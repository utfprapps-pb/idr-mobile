// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalModelAdapter extends TypeAdapter<AnimalModel> {
  @override
  final int typeId = 1;

  @override
  AnimalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalModel(
      id: fields[1] as int?,
      bornDate: fields[2] as String?,
      bornWeight: fields[3] as double?,
      breed: fields[4] as String?,
      currentWeight: fields[5] as double?,
      ecc: fields[6] as double?,
      identifier: fields[7] as String?,
      name: fields[8] as String?,
      previousWeight: fields[9] as double?,
      type: fields[10] as String?,
      propertyId: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AnimalModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.bornDate)
      ..writeByte(3)
      ..write(obj.bornWeight)
      ..writeByte(4)
      ..write(obj.breed)
      ..writeByte(5)
      ..write(obj.currentWeight)
      ..writeByte(6)
      ..write(obj.ecc)
      ..writeByte(7)
      ..write(obj.identifier)
      ..writeByte(8)
      ..write(obj.name)
      ..writeByte(9)
      ..write(obj.previousWeight)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.propertyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
