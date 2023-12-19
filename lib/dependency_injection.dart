import 'package:apotik/features/dashboard/data/datasources/product_api_service.dart';
import 'package:apotik/features/dashboard/data/repositories/product_repositories_impl.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/login/data/datasources/remote/login_api_services.dart';
import 'package:apotik/features/login/data/repositories/login_repository_impl.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:apotik/features/login/domain/usecases/get_login.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:apotik/features/login/presentation/bloc/get_login/login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_login/post_login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//dio
  sl.registerSingleton<Dio>(Dio());
  //http
  sl.registerLazySingleton(() => http.Client());
  //data source
  sl.registerLazySingleton<LoginApiService>(() => LoginApiService(sl()));
  sl.registerLazySingleton<LoginPostApi>(() => LoginPostApiImpl(client: sl()));
  sl.registerSingleton<ProducApiService>(ProducApiServiceImpl(client: sl()));
  //repository
  sl.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(loginApiService: sl(), loginPostApi: sl()));
  sl.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(producApiService: sl()));
//use case
  sl.registerSingleton<GetLoginUseCase>(GetLoginUseCase(loginRepository: sl()));
  sl.registerSingleton<PostLoginUseCase>(
      PostLoginUseCase(loginRepository: sl()));
  sl.registerSingleton<GetProductUseCase>(
      GetProductUseCase(productRepository: sl()));
  //bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl()));
  sl.registerFactory<PostLoginBloc>(() => PostLoginBloc(sl()));
  sl.registerFactory<DashboardBloc>(() => DashboardBloc(sl()));
}
