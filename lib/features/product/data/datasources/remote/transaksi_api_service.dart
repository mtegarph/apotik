import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/features/product/data/datasources/local/hive_data.dart';
import 'package:apotik/features/product/data/models/remote/transaksi_model.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;

class TransaksiApiService {
  final http.Client client;
  final HiveData hiveData;
  TransaksiApiService({
    required this.client,
    required this.hiveData,
  });

  Future postTransaksi(Transaksi parameterTransaksi) async {
    final _chuckerHttpClient = ChuckerHttpClient(client);
    print("data transaksi ${parameterTransaksi.toJson()}");
    String requestBody = jsonEncode(parameterTransaksi.toJson());

    final response = await _chuckerHttpClient.post(
        Uri.parse("${Urls.productBaseUrl}/transaksi/create"),
        headers: {"Content-Type": "application/json"},
        body: requestBody);

    if (response.statusCode == 201) {
      await hiveData.deleteAllSurveys();
      return true;
    } else {
      throw ServerException();
    }
  }
}
