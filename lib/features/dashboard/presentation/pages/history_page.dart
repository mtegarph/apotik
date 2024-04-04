import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/core/constant/constant.dart';

import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/dashboard/presentation/bloc/transaksi_history_bloc/transaksi_history_bloc.dart';
import 'package:apotik/features/history/presentation/bloc/get_detail_transaksi_bloc/history_bloc.dart';
import 'package:apotik/features/history/presentation/pages/detail_history.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Riwayat Pembelian",
            style: headlineStyleText(),
          ),
          bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              dividerColor: ColorStyle.successColor,
              tabs: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Proses",
                      style: titleStyleText(),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Selesai",
                      style: titleStyleText(),
                    ),
                  ),
                ),
              ]),
        ),
        body: const TabBarView(
            children: [HistoryProcessPage(), SizedBox.shrink()]),
      ),
    );
  }
}

class HistoryProcessPage extends StatefulWidget {
  const HistoryProcessPage({super.key});

  @override
  State<HistoryProcessPage> createState() => _HistoryProcessPageState();
}

class _HistoryProcessPageState extends State<HistoryProcessPage> {
  @override
  Widget build(BuildContext context) {
    // List<productsEntity> products = [
    //   productsEntity(
    //       namaObat: "Panadol Paracetamol",
    //       isiPerkemasan: "10 tablet",
    //       harga: 10000,
    //       gambar:
    //           "https://api.watsons.co.id/medias/zoom-front-10339.jpg?context=bWFzdGVyfHd0Y2lkL2ltYWdlc3w4OTY2NHxpbWFnZS9qcGVnfGFETmxMMmd6WlM4eE1UWTFPVFUxT0RjNE1EazFPQzk2YjI5dExXWnliMjUwTFRFd016TTVMbXB3Wnd8OGRlNTkzNjVhOTVkNWRkN2U5ZTQyMmVhM2Q2NDQ0ODVmODE5MTNkZjQ0NTE5ZGVmZGMzMzBjNzc3YTRjZTdiYQ"),
    //   productsEntity(
    //       namaObat: "Lansoprazole",
    //       isiPerkemasan: "10 tablet",
    //       harga: 15000,
    //       gambar:
    //           "https://images.k24klik.com/products/apotek_online_k24klik_20210430095421359225_LANSOPRAZOLE-HEXPHARM-30MG-CAPS-50S.jpg"),
    //   productsEntity(
    //       namaObat: "Lopamid",
    //       isiPerkemasan: "10 tablet",
    //       harga: 10000,
    //       gambar:
    //           "https://res-3.cloudinary.com/dk0z4ums3/image/upload/c_scale,h_750,w_750/v1/productsion/pharmacy/productss/1660093484_5fb37d1441ab59059e8686a0"),
    // ];
    return SingleChildScrollView(
      child: BlocBuilder<TransaksiHistoryBloc, TransaksiHistoryState>(
        builder: (context, state) {
          if (state is TransaksiHistoryLoading) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is TransaksiHistorySuccess) {
            return Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                direction: Axis.horizontal,
                children: List.generate(
                  state.products
                      .where((element) =>
                          element.statusTransaksi.toLowerCase() == "proses")
                      .length,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<DetailTransaksiBloc>().add(
                                  GetDetailTransaksi(
                                      idTransaksi:
                                          state.products[index].noTransaksi));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailHistoryPage(
                                      noTransaksi:
                                          state.products[index].noTransaksi,
                                    ),
                                  ));
                            },
                            child: card(
                              context,
                              state.products[index].noTransaksi.toString(),
                              "10 tablet",
                              "10000",
                              "https://api.watsons.co.id/medias/zoom-front-10339.jpg?context=bWFzdGVyfHd0Y2lkL2ltYWdlc3w4OTY2NHxpbWFnZS9qcGVnfGFETmxMMmd6WlM4eE1UWTFPVFUxT0RjNE1EazFPQzk2YjI5dExXWnliMjUwTFRFd016TTVMbXB3Wnd8OGRlNTkzNjVhOTVkNWRkN2U5ZTQyMmVhM2Q2NDQ0ODVmODE5MTNkZjQ0NTE5ZGVmZGMzMzBjNzc3YTRjZTdiYQ",
                            ),
                          ),
                          Divider(
                            color: Colors.grey[400],
                            height: 6,
                            thickness: 1,
                          )
                        ],
                      )),
                ));
          }
          if (state is TransaksiHistoryFailed) {
            return Text("${state.message}");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  card(BuildContext context, String title, String total, String price,
      String url) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: url,
              errorWidget: (context, url, error) {
                return const Icon(Icons.warning);
              },
            ),
          ),
        ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                title,
                style: headlineStyleText().copyWith(fontSize: 15),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Text(
                  "$total Items",
                  style: titleStyleText().copyWith(color: Colors.grey[600]),
                ),
                const SizedBox(width: 3),
                Text("•",
                    style: titleStyleText().copyWith(color: Colors.grey[600])),
                const SizedBox(width: 3),
                Text(
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                        .format(int.parse(price)),
                    style: titleStyleText().copyWith(color: Colors.grey[600])),
              ],
            )
          ],
        )
      ],
    );
  }
}
