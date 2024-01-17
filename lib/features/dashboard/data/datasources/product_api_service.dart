import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/features/dashboard/data/models/detail_obat.dart';
import 'package:apotik/features/dashboard/data/models/product_model.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;

abstract class ProducApiService {
  Future<List<ProductModel>> getProduct(String url);
  Future<DetaiObat> getDetailProduct(int idObat);
  Future<List<ProductModel>> getProductSearch(String keyword, String searchBy);
}

class ProducApiServiceImpl extends ProducApiService {
  final http.Client client;

  ProducApiServiceImpl({required this.client});
  @override
  Future<List<ProductModel>> getProduct(String url) async {
    List<ProductModel> products = [];
    final _chuckerResponse = ChuckerHttpClient(client);
    final response =
        await _chuckerResponse.get(Uri.parse(Urls.productBaseUrl + url));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      for (final item in jsonResponse) {
        final product = ProductModel.fromJson(item);
        products.add(product);
      }
      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetaiObat> getDetailProduct(int idObat) async {
    List<ProductModel> products = [];
    // TODO: implement getProduct
    final _chuckerResponse = ChuckerHttpClient(client);
    final response = await _chuckerResponse
        .get(Uri.parse('${Urls.productBaseUrl}/obat/id/$idObat'));

    if (response.statusCode == 200) {
      // final product = ProductModel.fromJson(response.body);
      return DetaiObat.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductSearch(
      String keyword, String searchBy) async {
    List<ProductModel> products = [];
    final _chuckerResponse = ChuckerHttpClient(client);
    final response = await _chuckerResponse.post(
        Uri.parse('${Urls.productBaseUrl}/obat/search'),
        body: {"keyword": keyword, "searchby": searchBy});
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      for (final item in jsonResponse) {
        final product = ProductModel.fromJson(item);
        products.add(product);
      }
      return products;
    } else {
      throw ServerException();
    }
  }
}
