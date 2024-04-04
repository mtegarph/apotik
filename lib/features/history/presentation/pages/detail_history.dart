import 'dart:io';

import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:apotik/features/history/presentation/bloc/get_detail_transaksi_bloc/history_bloc.dart';
import 'package:apotik/features/history/presentation/bloc/set_transaksi_bloc/set_transaksi_bloc.dart';
import 'package:apotik/features/history/presentation/widgets/custom_box_picker.dart';
import 'package:apotik/features/product/presentation/bloc/set_transaksi_bloc/set_transaksi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DetailHistoryPage extends StatefulWidget {
  final int noTransaksi;
  const DetailHistoryPage({super.key, required this.noTransaksi});

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
  XFile? _transaki;
  final ImagePicker _picker = ImagePicker();
  Future _handleUpload() async {
    final XFile? photo =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    setState(() {
      _transaki = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Transaksi",
          style: headlineStyleText(),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<SetTransaksiBayarBloc, SetTransaksiBayarState>(
        listener: (context, state) {
          if (state is SetTransaksiBayarSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.greenAccent,
                content: Text("Transaksi Berhasil Dilakukan"),
              ),
            );
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: Colors.black,
            //     content: Text(state.message),
            //   ),
            // );
          } else if (state is SetTransaksiBayarFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 50,
                child: CustomButton(
                    function: () {
                      if (_transaki == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text("Bukti Foto Harus Diisi"),
                          ),
                        );
                      } else {
                        ParameterTransaksi parameterTransaksi =
                            ParameterTransaksi(
                          noTransaksi: widget.noTransaksi,
                          image: File(_transaki!.path),
                          statusTransaksi: 'Selesai',
                        );
                        context.read<SetTransaksiBayarBloc>().add(
                            SetTransaksiPayment(
                                parameterTransaksi: parameterTransaksi));
                      }
                    },
                    child: Text(
                      "Bayar",
                      style: headlineStyleText().copyWith(color: Colors.white),
                    ))),
          );
        },
      ),
      body: BlocBuilder<DetailTransaksiBloc, DetailTransaksiState>(
        builder: (context, state) {
          if (state is DetailTransaksiLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DetailTransaksiFailed) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is DetailTransaksiSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Obat Yang Dipesan",
                          style: headlineStyleText(),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final item = state.products[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: detailPesanan(item.qty, item.namaObat,
                                      item.hargaObat.toString(), null),
                                );
                              }),
                        ),
                        const Gap(20),
                        detailPesanan(
                            0,
                            'SubTotal',
                            state.products
                                .map((e) => e.hargaObat * (e.qty))
                                .reduce((value, element) => value + element)
                                .toString(),
                            null),
                        const Gap(10),
                        detailPesanan(0, 'PPN 10%', '5000', null),
                        const Gap(10),
                        detailPesanan(0, 'Biaya Pemesanan', '5000', null),
                        const Gap(50),
                        detailPesanan(
                            0,
                            'Total pembayaran',
                            ((state.products
                                            .map((e) => e.hargaObat * (e.qty))
                                            .reduce((value, element) =>
                                                value + element) *
                                        0.10) +
                                    state.products
                                        .map((e) => e.hargaObat * (e.qty))
                                        .reduce((value, element) =>
                                            value + element) +
                                    5000)
                                .toString(),
                            18),
                        const Gap(30),
                        CustomBoxPicker(
                            label: "UNGGAH TRANSAKSI",
                            hint: "UNGGAH FOTO",
                            icon: const Icon(
                              Icons.upload,
                              color: Colors.greenAccent,
                              size: 32,
                            ),
                            onTap: () => _handleUpload(),
                            child: _transaki == null
                                ? null
                                : Image.file(File(_transaki!.path),
                                    fit: BoxFit.contain)),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Row detailPesanan(int index, String? title, String? harga, int? fontSize) {
    return Row(
      children: [
        Text(
          index == 0 ? '' : '${index + 1}x',
        ),
        const Gap(10),
        Text(
          title ?? 'Paracetamol',
          style: titleStyleText().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: fontSize == null ? 13 : fontSize.toDouble()),
        ),
        const Spacer(),
        Text(
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
              .format(double.parse(harga ?? '0')),
        ),
      ],
    );
  }
}
