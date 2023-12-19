import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/login/data/models/login_model.dart';
import 'package:apotik/features/login/data/repositories/login_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockLoginApiService mockLoginApiService;
  late MockLoginPostApi mockLoginPostApi;
  late LoginRepositoryImpl loginRepositoryImpl;
  final testloginModel = Login(
      data: Data(
          id: 1,
          email: "mtegarph@gmail.com",
          firstName: "tets",
          lastName: "test",
          avatar: "https://reqres.in/img/faces/2-image.jpg"),
      support: Support(
          url: "https://reqres.in/#support-heading",
          text:
              "To keep ReqRes free, contributions towards server costs are appreciated!"));
  setUp(() {
    mockLoginApiService = MockLoginApiService();
    mockLoginPostApi = MockLoginPostApi();
    loginRepositoryImpl = LoginRepositoryImpl(
        loginApiService: mockLoginApiService, loginPostApi: mockLoginPostApi);
  });
  group("Test Repository implement", () {
    test('should return login when call to data source successful', () async {
      //arrange
      when(mockLoginApiService.getLogin()).thenAnswer((realInvocation) async =>
          HttpResponse(
              testloginModel,
              Response(
                  requestOptions: RequestOptions(),
                  data: testloginModel,
                  statusCode: 200)));

      //act
      final result = await loginRepositoryImpl.getLoginData();
      //assert
      expect(result, equals(Right(testloginModel)));
    });

    test('should return server failure when call to data source unsuccessful',
        () async {
      //arrange
      when(mockLoginApiService.getLogin()).thenThrow(ServerException());

      //act
      final result = await loginRepositoryImpl.getLoginData();
      //assert
      expect(result, equals(const Left(ServerFailure("An Error Has Occured"))));
    });
  });
}
