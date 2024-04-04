import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetKeranjangProductUseCase mockGetKeranjangProductUseCase;
  late GetKeranjangBloc getKeranjangBloc;
  setUp(() {
    mockGetKeranjangProductUseCase = MockGetKeranjangProductUseCase();
    getKeranjangBloc = GetKeranjangBloc(mockGetKeranjangProductUseCase);
  });
  List<DetaiObatKeranjangEntity> item = [
    DetaiObatKeranjangEntity(
        gambar: "test", gejala: "test", stok: 2, harga: 100),
    DetaiObatKeranjangEntity(
        gambar: "test2", gejala: "test2", stok: 4, harga: 500),
  ];
  group("Bloc Test", () {
    test('Initial State shoulb be empty', () {
      expect(getKeranjangBloc.state, GetKeranjangInitial());
    });
    blocTest<GetKeranjangBloc, GetKeranjangState>(
      "get keranjang bloc test [ GetKeranjangLoading, GetKeranjangSuccess]",
      build: () {
        //act
        when(mockGetKeranjangProductUseCase.call())
            .thenAnswer((realInvocation) async => Right(item));
        return getKeranjangBloc;
      },
      act: (bloc) => bloc.add(GetKeranjang()),
      expect: () => <GetKeranjangState>[
        GetKeranjangLoading(),
        GetKeranjangSuccess(item: item)
      ],
    );
    blocTest<GetKeranjangBloc, GetKeranjangState>(
      "get keranjang bloc test [ GetKeranjangLoading, GetKeranjangFailed]",
      build: () {
        when(mockGetKeranjangProductUseCase.call()).thenAnswer(
            (realInvocation) async =>
                const Left(ConnectionFailure("no network")));
        return getKeranjangBloc;
      },
      act: (bloc) => bloc.add(GetKeranjang()),
      expect: () => <GetKeranjangState>[
        GetKeranjangLoading(),
        GetKeranjangFailed(message: "no network")
      ],
    );
  });
}
