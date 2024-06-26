import 'package:apotik/features/dashboard/data/datasources/product_api_service.dart';
import 'package:apotik/features/dashboard/data/repositories/product_repositories_impl.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_detail_product.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product_search.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_transaksi.dart';
import 'package:apotik/features/dashboard/presentation/bloc/bloc/product_search_bloc.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/dashboard/presentation/bloc/transaksi_history_bloc/transaksi_history_bloc.dart';
import 'package:apotik/features/history/data/datasources/detail_transaksi_api.dart';
import 'package:apotik/features/history/data/repositories/transaction_detail_repo_impl.dart';
import 'package:apotik/features/history/domain/repositories/transaction_detail_repo.dart';
import 'package:apotik/features/history/domain/usecases/get_transaction_detail_usecase.dart';
import 'package:apotik/features/history/domain/usecases/set_transaction_bayar_usecase.dart';
import 'package:apotik/features/history/presentation/bloc/get_detail_transaksi_bloc/history_bloc.dart';
import 'package:apotik/features/history/presentation/bloc/set_transaksi_bloc/set_transaksi_bloc.dart';
import 'package:apotik/features/login/data/datasources/remote/login_api_services.dart';
import 'package:apotik/features/login/data/models/local/local_login.dart';
import 'package:apotik/features/login/data/repositories/login_repository_impl.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:apotik/features/login/domain/usecases/get_login.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:apotik/features/login/domain/usecases/post_register.dart';
import 'package:apotik/features/login/presentation/bloc/get_login/login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_login/post_login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_register/post_register_bloc.dart';
import 'package:apotik/features/product/data/datasources/local/hive_data.dart';
import 'package:apotik/features/product/data/datasources/remote/transaksi_api_service.dart';
import 'package:apotik/features/product/data/repositories/detail_product_repository_impl.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:apotik/features/product/domain/usecases/detail_product_keranjang_usecase.dart';
import 'package:apotik/features/product/domain/usecases/set_product_keranjang_usecase.dart';
import 'package:apotik/features/product/domain/usecases/set_transaksi_usecase.dart';
import 'package:apotik/features/product/presentation/bloc/keranjang_bloc/keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';

import 'package:apotik/features/product/presentation/bloc/product_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/set_transaksi_bloc/set_transaksi_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
//dio
  sl.registerSingleton<Dio>(Dio());
  //sharedpref
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  //http
  sl.registerLazySingleton(() => http.Client());
  //data source
  sl.registerLazySingleton<LoginApiService>(() => LoginApiService(sl()));
  sl.registerLazySingleton<LoginPostApi>(
      () => LoginPostApiImpl(client: sl(), localLogin: sl()));
  sl.registerLazySingleton<DetailTransaksiApi>(
      () => DetailTransaksiApi(client: sl()));

  sl.registerSingleton<ProducApiService>(ProducApiServiceImpl(client: sl()));
  sl.registerSingleton<HiveData>(HiveData());
  sl.registerSingleton<LocalLogin>(LocalLogin());
  sl.registerLazySingleton<TransaksiApiService>(
      () => TransaksiApiService(client: sl(), hiveData: sl()));
  //repository
  sl.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(loginApiService: sl(), loginPostApi: sl()));
  sl.registerSingleton<ProductRepository>(
      ProductRepositoryImpl(producApiService: sl()));
  sl.registerSingleton<ProductDetailRepository>(
      DetailProductRepositoryImpl(hiveData: sl(), transaksiApiService: sl()));
  sl.registerSingleton<TransactionDetailRepo>(
      TransactionDetailRepoImpl(detailTransaksiApi: sl()));
//use case
  sl.registerSingleton<GetLoginUseCase>(GetLoginUseCase(loginRepository: sl()));
  sl.registerSingleton<PostLoginUseCase>(
      PostLoginUseCase(loginRepository: sl()));
  sl.registerSingleton<GetDetailProductUseCase>(
      GetDetailProductUseCase(productRepository: sl()));
  sl.registerSingleton<SetTransaksiUseCase>(
      SetTransaksiUseCase(productDetailRepository: sl()));
  sl.registerSingleton<SetProductKeranjangUseCase>(
      SetProductKeranjangUseCase(productDetailRepository: sl()));
  sl.registerSingleton<GetProductUseCase>(
      GetProductUseCase(productRepository: sl()));
  sl.registerSingleton<GetKeranjangProductUseCase>(
      GetKeranjangProductUseCase(productDetailRepository: sl()));
  sl.registerSingleton<GetProductSearchUseCase>(
      GetProductSearchUseCase(productRepository: sl()));
  sl.registerSingleton<PostRegisterUseCase>(
      PostRegisterUseCase(loginRepository: sl()));
  sl.registerSingleton<GetTransaksiUseCase>(
      GetTransaksiUseCase(productRepository: sl()));
  sl.registerSingleton<GetDetailTransaksiUseCase>(
      GetDetailTransaksiUseCase(transactionDetailRepo: sl()));
  sl.registerSingleton<SetTransaksiBayarUseCase>(
      SetTransaksiBayarUseCase(transactionDetailRepo: sl()));
  //bloc
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl()));
  sl.registerFactory<PostLoginBloc>(() => PostLoginBloc(sl()));
  sl.registerFactory<DashboardBloc>(() => DashboardBloc(sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
  sl.registerFactory<KeranjangBloc>(() => KeranjangBloc(sl()));
  sl.registerFactory<GetKeranjangBloc>(() => GetKeranjangBloc(sl()));
  sl.registerFactory<ProductSearchBloc>(() => ProductSearchBloc(sl()));
  sl.registerFactory<PostRegisterBloc>(() => PostRegisterBloc(sl()));
  sl.registerFactory<SetTransaksiBloc>(() => SetTransaksiBloc(sl()));
  sl.registerFactory<TransaksiHistoryBloc>(() => TransaksiHistoryBloc(sl()));
  sl.registerFactory<DetailTransaksiBloc>(() => DetailTransaksiBloc(sl()));
  sl.registerFactory<SetTransaksiBayarBloc>(() => SetTransaksiBayarBloc(sl()));
}
