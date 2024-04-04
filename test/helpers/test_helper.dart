import 'package:apotik/features/login/data/datasources/remote/login_api_services.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:apotik/features/login/domain/usecases/get_login.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:apotik/features/product/domain/usecases/detail_product_keranjang_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';

@GenerateMocks([
  LoginRepository,
  LoginApiService,
  ProductDetailRepository,
  LoginPostApi,
  GetLoginUseCase,
  PostLoginUseCase,
  GetKeranjangProductUseCase
], customMocks: [
  MockSpec<http.Client>(
    as: #MockHttpClient,
  ),
  MockSpec<Dio>(
    as: #MockDio,
  ),
  MockSpec<RequestOptions>(
    as: #MockRequestOptions,
  )
])
void main() {}
