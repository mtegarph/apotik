import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/features/dashboard/data/models/product_model.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;

abstract class ProducApiService {
  Future<ProductModel> getProduct();
}

class ProducApiServiceImpl extends ProducApiService {
  final http.Client client;

  ProducApiServiceImpl({required this.client});
  @override
  Future<ProductModel> getProduct() async {
    // TODO: implement getProduct
    final _chuckerResponse = ChuckerHttpClient(client);
    final response =
        await _chuckerResponse.get(Uri.parse('${Urls.productBaseUrl}/products'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
