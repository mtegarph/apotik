import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/error/exception.dart';
import 'package:apotik/features/login/data/datasources/remote/login_api_services.dart';
import 'package:apotik/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late LoginApiService loginApiService;
  late MockRequestOptions mockRequestOptions;
  setUp(() {
    mockDio = MockDio();
    when(mockDio.options).thenReturn(BaseOptions());

    mockRequestOptions = MockRequestOptions();
    when(mockDio.fetch(any)).thenAnswer((_) async => Response<
            Map<String, dynamic>>(
        requestOptions: mockRequestOptions,
        data: jsonDecode(readJson('helpers/dummy_data/dummy_login_data.json')),
        statusCode: 200));
    loginApiService = LoginApiService(mockDio);
  });
  group('test api call', () {
    test('should return login model if response 202', () async {
      //arrange
      when(mockDio.get('${Urls.baseUrl}/api/users/2')).thenAnswer(
          (realInvocation) async => Response(
              requestOptions: mockRequestOptions,
              data: jsonDecode(
                  readJson('helpers/dummy_data/dummy_login_data.json')),
              statusCode: 202));
      //act
      final result = await loginApiService.getLogin();
      //assert
      expect(result.data, isA<Login>());
    });
    test('should return a server exception if the response is 404 or other ',
        () async {
      //arrange
      when(mockDio.fetch(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: '${Urls.baseUrl}/api/users/2'),
        error: '404 error',
        type: DioExceptionType.sendTimeout,
        response: Response(
            requestOptions: RequestOptions(path: '${Urls.baseUrl}/api/users/2'),
            statusCode: 404),
      ));

      //act
      final result = loginApiService.getLogin();

      //assert
      expect(result, throwsA(isInstanceOf<DioException>()));
    });
  });
}
