// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineModelAdapter extends TypeAdapter<MedicineModel> {
  @override
  final int typeId = 4;

  @override
  MedicineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      animalIdentifier: fields[3] as String?,
      date: fields[4] as String?,
      activePrinciple: fields[5] as String?,
      name: fields[6] as String?,
      dose: fields[7] as String?,
      applicationType: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.activePrinciple)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.dose)
      ..writeByte(8)
      ..write(obj.applicationType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
