// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_animal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiseaseAnimalModelAdapter extends TypeAdapter<DiseaseAnimalModel> {
  @override
  final int typeId = 5;

  @override
  DiseaseAnimalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiseaseAnimalModel(
      id: fields[1] as int?,
      internalId: fields[2] as String?,
      animalIdentifier: fields[3] as String?,
      dateDiagnostic: fields[4] as String?,
      diagnostic: fields[5] as String?,
      isEdited: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, DiseaseAnimalModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.internalId)
      ..writeByte(3)
      ..write(obj.animalIdentifier)
      ..writeByte(4)
      ..write(obj.dateDiagnostic)
      ..writeByte(5)
      ..write(obj.diagnostic)
      ..writeByte(6)
      ..write(obj.isEdited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiseaseAnimalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
