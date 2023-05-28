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
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      bornDate: fields[3] as String?,
      bornWeight: fields[4] as double?,
      breed: fields[5] as String?,
      currentWeight: fields[6] as double?,
      ecc: fields[7] as double?,
      identifier: fields[8] as String?,
      name: fields[9] as String?,
      previousWeight: fields[10] as double?,
      type: fields[11] as String?,
      idProperty: fields[12] as int?,
      bornInProperty: fields[13] as bool?,
      animalMotherIdentifier: fields[14] as String?,
      dead: fields[15] as bool?,
      deadDate: fields[16] as String?,
      bornCondition: fields[17] as String?,
      gender: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AnimalModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.bornDate)
      ..writeByte(4)
      ..write(obj.bornWeight)
      ..writeByte(5)
      ..write(obj.breed)
      ..writeByte(6)
      ..write(obj.currentWeight)
      ..writeByte(7)
      ..write(obj.ecc)
      ..writeByte(8)
      ..write(obj.identifier)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.previousWeight)
      ..writeByte(11)
      ..write(obj.type)
      ..writeByte(12)
      ..write(obj.idProperty)
      ..writeByte(13)
      ..write(obj.bornInProperty)
      ..writeByte(14)
      ..write(obj.animalMotherIdentifier)
      ..writeByte(15)
      ..write(obj.dead)
      ..writeByte(16)
      ..write(obj.deadDate)
      ..writeByte(17)
      ..write(obj.bornCondition)
      ..writeByte(18)
      ..write(obj.gender);
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
