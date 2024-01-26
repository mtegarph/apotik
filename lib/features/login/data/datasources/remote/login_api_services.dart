import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/core/parameter/register.dart';
import 'package:apotik/features/login/data/models/local/local_login.dart';
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
  Future postRegister(ParameterRegister parameterRegister);
}

class LoginPostApiImpl extends LoginPostApi {
  final http.Client client;
  final LocalLogin localLogin;
  LoginPostApiImpl({required this.client, required this.localLogin});
  @override
  Future postApi(ParameterUpdate parameterUpdate) async {
    final _chuckerHttpClient = ChuckerHttpClient(client);
    final response = await _chuckerHttpClient
        .post(Uri.parse("${Urls.productBaseUrl}/user/login"), body: {
      'username': parameterUpdate.name,
      'password': parameterUpdate.password
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      await localLogin.saveBearerToken(data['token']);
      await localLogin.saveNamaCustomer(data['namaCustomer']);
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future postRegister(ParameterRegister parameterRegister) async {
    final _chuckerHttpClient = ChuckerHttpClient(client);
    final response = await _chuckerHttpClient
        .post(Uri.parse("${Urls.productBaseUrl}/customer/register"), body: {
      'username': parameterRegister.username,
      'password': parameterRegister.password,
      'emailCustomer': parameterRegister.email,
      'noTelp': parameterRegister.noHp,
      'namaCustomer': parameterRegister.name,
      'alamatCustomer': parameterRegister.alamat
    });

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }
}
