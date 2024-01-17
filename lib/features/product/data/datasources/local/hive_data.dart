import 'dart:async';

import 'package:apotik/features/product/data/models/local/obat_hive.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:hive/hive.dart';

class HiveData {
  Box<ObatHive> obatBox = Hive.box<ObatHive>('obat_box');
  Future<List<ObatHive>> getAllDataSurvey() async {
    try {
      Iterable obat = obatBox.values;
      return obat.toList() as FutureOr<List<ObatHive>>;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addSurveyOffline(ObatHive validasiOfflineEntity) async {
    try {
      final items = obatBox.values
          .where((element) => element.nroObat == validasiOfflineEntity.nroObat)
          .firstOrNull;
      if (items == null) {
        await obatBox.add(validasiOfflineEntity);
      } else {
        await obatBox.put(items.key, validasiOfflineEntity);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteSurveyByNmrObat(
      DetaiObatKeranjangEntity obatKeranjangEntity) async {
    final box = Hive.box<ObatHive>('obat_box');
    final valPOI = box.values.firstWhere(
      (entity) => entity.nroObat == obatKeranjangEntity.nroObat,
      orElse: () => throw Exception('Entity not found in the box'),
    );
    await box.delete(valPOI.key);
  }

  Future<void> deleteAllSurveys() async {
    obatBox.clear();
  }
}
