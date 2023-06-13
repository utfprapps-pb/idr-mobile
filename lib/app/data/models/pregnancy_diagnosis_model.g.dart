// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_diagnosis_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PregnancyDiagnosisModelAdapter
    extends TypeAdapter<PregnancyDiagnosisModel> {
  @override
  final int typeId = 7;

  @override
  PregnancyDiagnosisModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PregnancyDiagnosisModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      date: fields[3] as String?,
      animalIdentifier: fields[4] as String?,
      dateLastInsemination: fields[5] as String?,
      isEdited: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PregnancyDiagnosisModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.animalIdentifier)
      ..writeByte(5)
      ..write(obj.dateLastInsemination)
      ..writeByte(6)
      ..write(obj.isEdited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PregnancyDiagnosisModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
