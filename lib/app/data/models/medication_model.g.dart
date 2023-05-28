// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationModelAdapter extends TypeAdapter<MedicationModel> {
  @override
  final int typeId = 6;

  @override
  MedicationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicationModel(
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
  void write(BinaryWriter writer, MedicationModel obj) {
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
      other is MedicationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
