// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurchaseModelAdapter extends TypeAdapter<PurchaseModel> {
  @override
  final int typeId = 9;

  @override
  PurchaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PurchaseModel(
      internalId: fields[1] as String?,
      id: fields[2] as int?,
      datePurchase: fields[3] as String?,
      animalIdentifier: fields[4] as String?,
      dateBirth: fields[5] as String?,
      weight: fields[6] as double?,
      value: fields[7] as double?,
      isEdited: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PurchaseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.internalId)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.datePurchase)
      ..writeByte(4)
      ..write(obj.animalIdentifier)
      ..writeByte(5)
      ..write(obj.dateBirth)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.value)
      ..writeByte(8)
      ..write(obj.isEdited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
