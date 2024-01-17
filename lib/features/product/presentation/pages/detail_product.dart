import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/config/widgets/custom_rating_bar.dart';
import 'package:apotik/core/utils/size_utils.dart';
import 'package:apotik/dependency_injection.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/presentation/bloc/bloc/keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supercharged/supercharged.dart';

class DetailProductPage extends StatefulWidget {
  final int index;
  final int idObat;
  final ProductEntity productEntity;
  const DetailProductPage(
      {super.key,
      required this.index,
      required this.productEntity,
      required this.idObat});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetDetailObat(widget.idObat));
    // sl<ProductBloc>().add(GetDetailObat(widget.idObat));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ObatDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ObatDetailSuccess) {
            return Stack(
              children: [
                Hero(
                  tag: 'product${widget.index}',
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height / 2,
                    imageUrl:
                        'https://images.k24klik.com/product/0104k0131.jpg',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Text(error.toString()),
                    fit: BoxFit.cover, // Adjust the fit property as needed
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      maxChildSize: 1,
                      minChildSize: 0.6,
                      builder: (context, scrollController) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                //borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    state.product.merekObat
                                                        .toString(),
                                                    style: headlineStyleText()),
                                                SizedBox(height: 3.v),
                                                Row(children: [
                                                  CustomRatingBar(
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.v),
                                                      initialRating: 0),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4.h),
                                                      child: Text("4.5",
                                                          style:
                                                              titleStyleText()))
                                                ])
                                              ]),
                                          const Spacer(),
                                          Container(
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
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.h,
                                                  top: 9.v,
                                                  bottom: 10.v),
                                              child: Text("14 Items",
                                                  style: titleStyleText())),
                                          Container(
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
                                                  style: titleStyleText()))
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(
                                      "Dapat Menyembuhkan ${state.product.gejala.toString()}",
                                      softWrap: true,
                                      textAlign: TextAlign.justify,
                                      style: titleStyleText(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget bottomNavigationBar() => SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 15),
                  child: Text(
                    "Harga",
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: titleStyleText(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Rp 15.000",
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: titleStyleText(),
                  ),
                ),
              ],
            ),
            BlocConsumer<KeranjangBloc, KeranjangState>(
              listener: (context, state) {
                if (state is AddKeranjangSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Obat Berhasilar Dalam Keranjang'),
                  ));
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, stateProduct) {
                    if (stateProduct is ObatDetailSuccess) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 150,
                        height: 50,
                        child: CustomButton(
                            function: () {
                              DetaiObatKeranjangEntity
                                  detaiObatKeranjangEntity =
                                  DetaiObatKeranjangEntity(
                                      stok: 1,
                                      gejala: stateProduct.product.gejala,
                                      harga: stateProduct.product.harga,
                                      jenisObat: stateProduct.product.jenisObat,
                                      merekObat: stateProduct.product.merekObat,
                                      namaObat: stateProduct.product.namaObat,
                                      nroObat: stateProduct.product.nroObat);
                              context.read<KeranjangBloc>().add(AddKeranjang(
                                  detaiObatKeranjangEntity:
                                      detaiObatKeranjangEntity));
                            },
                            child: Text(
                              "Beli",
                              style: headlineStyleText()
                                  .copyWith(color: Colors.white),
                            )),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
          ],
        ),
      );
}
