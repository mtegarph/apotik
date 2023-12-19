import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/data/models/login_model.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'login_api_services.g.dart';

@RestApi(baseUrl: Urls.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;
  @GET('/api/users/2')
  Future<HttpResponse<Login>> getLogin();
}

abstract class LoginPostApi {
  Future postApi(ParameterUpdate parameterUpdate);
}

class LoginPostApiImpl extends LoginPostApi {
  final http.Client client;

  LoginPostApiImpl({required this.client});
  @override
  Future postApi(ParameterUpdate parameterUpdate) async {
    final _chuckerHttpClient = ChuckerHttpClient(client);
    final response = await _chuckerHttpClient.post(
        Uri.parse("${Urls.baseUrl}/api/users"),
        body: {'name': parameterUpdate.name, 'job': parameterUpdate.email});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }
}
