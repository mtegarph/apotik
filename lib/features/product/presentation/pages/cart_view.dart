import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/core/utils/size_utils.dart';
import 'package:apotik/features/product/data/datasources/local/hive_data.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/presentation/bloc/bloc/keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: "4D4D4D".toColor()),
          title: Text(
            "Keranjang Beli",
            style: headlineStyleText(),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                  function: () {},
                  child: Text(
                    "Bayar",
                    style: headlineStyleText().copyWith(color: Colors.white),
                  ))),
        ),
        body: BlocBuilder<GetKeranjangBloc, GetKeranjangState>(
          builder: (context, state) {
            if (state is GetKeranjangLoading) {
              return const CupertinoActivityIndicator();
            }
            if (state is GetKeranjangFailed) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is GetKeranjangSuccess && state.item.isNotEmpty) {
              print(state.item.length);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.item.length,
                        itemBuilder: (context, index) {
                          final item = state.item[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Stack(
                              children: [
                                CardObat(
                                  item: item,
                                ),
                                Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                        onPressed: () async {
                                          await HiveData()
                                              .deleteSurveyByNmrObat(item);
                                          context
                                              .read<GetKeranjangBloc>()
                                              .add(GetKeranjang());
                                        },
                                        icon: const Icon(Icons.close))),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 10),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              DetaiObatKeranjangEntity
                                                  detaiObatKeranjangEntity =
                                                  DetaiObatKeranjangEntity(
                                                      gambar: item.gambar,
                                                      stok: item.stok == 0
                                                          ? 0
                                                          : item.stok! - 1,
                                                      gejala: item.gejala,
                                                      harga: item.harga,
                                                      jenisObat: item.jenisObat,
                                                      merekObat: item.merekObat,
                                                      namaObat: item.namaObat,
                                                      nroObat: item.nroObat);
                                              item.stok == 0
                                                  ? await HiveData()
                                                      .deleteSurveyByNmrObat(
                                                          item)
                                                  : context
                                                      .read<KeranjangBloc>()
                                                      .add(AddKeranjang(
                                                          detaiObatKeranjangEntity:
                                                              detaiObatKeranjangEntity));
                                              context
                                                  .read<GetKeranjangBloc>()
                                                  .add(GetKeranjang());
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 8.v, bottom: 10.v),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.h,
                                                    vertical: 1.v),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.h,
                                                  ),
                                                ),
                                                child: Text("-",
                                                    style: titleStyleText())),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h,
                                                  top: 9.v,
                                                  bottom: 10.v),
                                              child: Text("${item.stok} Items",
                                                  style: titleStyleText())),
                                          GestureDetector(
                                            onTap: () {
                                              DetaiObatKeranjangEntity
                                                  detaiObatKeranjangEntity =
                                                  DetaiObatKeranjangEntity(
                                                      gambar: item.gambar,
                                                      stok: item.stok! + 1,
                                                      gejala: item.gejala,
                                                      harga: item.harga,
                                                      jenisObat: item.jenisObat,
                                                      merekObat: item.merekObat,
                                                      namaObat: item.namaObat,
                                                      nroObat: item.nroObat);
                                              context.read<KeranjangBloc>().add(
                                                  AddKeranjang(
                                                      detaiObatKeranjangEntity:
                                                          detaiObatKeranjangEntity));
                                              context
                                                  .read<GetKeranjangBloc>()
                                                  .add(GetKeranjang());
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 10.h,
                                                    top: 8.v,
                                                    bottom: 10.v),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.h,
                                                    vertical: 1.v),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.h,
                                                  ),
                                                ),
                                                child: Text("+",
                                                    style: titleStyleText())),
                                          )
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      CarDetail(
                        total: state.item
                            .map((e) => e.harga! * (e.stok ?? 0))
                            .reduce((value, element) => value + element),
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}

class CardObat extends StatelessWidget {
  final DetaiObatKeranjangEntity item;
  const CardObat({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 8),
                spreadRadius: 3,
                color: Colors.grey[300]!)
          ]),
      width: double.infinity,
      height: 120,
      child: Row(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image:
                        NetworkImage('${Urls.productBaseUrl}/${item.gambar}'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(15),
              SizedBox(
                width: 140,
                child: Text(item.merekObat.toString(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: headlineStyleText()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const Gap(2),
              SizedBox(
                width: 150,
                child: Text(item.jenisObat.toString(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ),
              const Gap(15),
              Text(
                NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                    .format(item.harga),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CarDetail extends StatelessWidget {
  final int total;
  const CarDetail({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(5, 8),
                  spreadRadius: 3,
                  color: Colors.grey[300]!)
            ]),
        width: double.infinity,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Detail Order"),
              ),
              Divider(
                indent: 10,
                color: Colors.grey[300],
                thickness: 1.3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Order"),
                    Text(
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                          .format(total),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("PPN"), Text("10%")],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Ongkir"),
                    Text(
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                          .format(5000),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total"),
                    Text(NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                        .format((total * 0.10) + total + 5000)
                        .toString())
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
