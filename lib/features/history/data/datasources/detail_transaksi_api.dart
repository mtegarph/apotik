import 'dart:convert';
import 'dart:io';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/features/history/data/models/detail_transaksi_model.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;

class DetailTransaksiApi {
  final http.Client client;

  DetailTransaksiApi({required this.client});
  Future<List<TransactionDetailModel>> getTransaksiDetail(
      int idTransaksi) async {
    List<TransactionDetailModel> products = [];
    final chuckerResponse = ChuckerHttpClient(client);
    final response = await chuckerResponse.get(
      Uri.parse(
          '${Urls.productBaseUrl}/transaksi/detailpenjualan/$idTransaksi'),
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      for (final item in jsonResponse) {
        final product = TransactionDetailModel.fromJson(item);
        products.add(product);
      }
      return products;
    } else {
      throw ServerException();
    }
  }

  Future<bool> sendTransactionStatusAndImage(
      {required String statusTransaksi,
      required File imageFile,
      required int noTransaksi}) async {
    // Wrap the http.Client with ChuckerHttpClient
    final chuckerResponse = ChuckerHttpClient(client);

    var request = http.MultipartRequest('PUT',
        Uri.parse('${Urls.productBaseUrl}/transaksi/$noTransaksi/update'));

    // Add the statusTransaksi as a text field
    request.fields['statusTransaksi'] = statusTransaksi;

    // Add the image file
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    // Send the request using the wrapped client
    var response = await chuckerResponse.send(request);

    // Check the response status
    if (response.statusCode == 200) {
      print('Upload successful');
      return true;
    } else {
      print('Upload failed');
      return false;
    }
  }
}
