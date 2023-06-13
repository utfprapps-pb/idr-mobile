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
      applicationDate: fields[4] as String?,
      activePrinciple: fields[5] as String?,
      appliedDose: fields[6] as String?,
      applicationWay: fields[7] as String?,
      idProduct: fields[8] as int?,
      isEdited: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicationModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.applicationDate)
      ..writeByte(5)
      ..write(obj.activePrinciple)
      ..writeByte(6)
      ..write(obj.appliedDose)
      ..writeByte(7)
      ..write(obj.applicationWay)
      ..writeByte(8)
      ..write(obj.idProduct)
      ..writeByte(9)
      ..write(obj.isEdited);
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
