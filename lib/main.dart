import 'package:apotik/config/routes/routes.dart';
import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/dependency_injection.dart';
import 'package:apotik/features/dashboard/presentation/bloc/bloc/product_search_bloc.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:apotik/features/login/presentation/bloc/get_login/login_bloc.dart';
import 'package:apotik/features/login/presentation/bloc/post_login/post_login_bloc.dart';

import 'package:apotik/features/login/presentation/pages/login_page.dart';
import 'package:apotik/features/product/data/models/local/obat_hive.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/bloc/keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/product_bloc.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<ObatHive>(ObatHiveAdapter());
  await Hive.openBox<ObatHive>('obat_box');
  ChuckerFlutter.showOnRelease = true;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => sl()..add(const OnLogin()),
        ),
        BlocProvider<PostLoginBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => sl()..add(const GetProductEvent("/obat/umum/")),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<KeranjangBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<GetKeranjangBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<ProductSearchBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: appBarTheme()),
        home: const DashboardPage(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
