// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obat_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObatHiveAdapter extends TypeAdapter<ObatHive> {
  @override
  final int typeId = 0;

  @override
  ObatHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObatHive(
      nroObat: fields[0] as int?,
      merekObat: fields[1] as String?,
      namaObat: fields[2] as String?,
      jenisObat: fields[3] as String?,
      harga: fields[5] as int?,
      stok: fields[6] as int?,
      gejala: fields[4] as String?,
      gambar: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ObatHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nroObat)
      ..writeByte(1)
      ..write(obj.merekObat)
      ..writeByte(2)
      ..write(obj.namaObat)
      ..writeByte(3)
      ..write(obj.jenisObat)
      ..writeByte(4)
      ..write(obj.gejala)
      ..writeByte(5)
      ..write(obj.harga)
      ..writeByte(6)
      ..write(obj.stok)
      ..writeByte(7)
      ..write(obj.gambar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObatHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
