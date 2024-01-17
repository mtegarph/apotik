import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/features/product/data/datasources/local/hive_data.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetKeranjangBloc, GetKeranjangState>(
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
          return Scaffold(
            appBar: AppBar(
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
                        "Beli",
                        style:
                            headlineStyleText().copyWith(color: Colors.white),
                      ))),
            ),
            body: SingleChildScrollView(
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
                                      icon: const Icon(Icons.close)))
                            ],
                          ),
                        );
                      },
                    ),
                    CarDetail(
                      total: state.item
                          .map((e) => e.harga!)
                          .reduce((value, element) => value + element),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
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
                image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        "https://uploads-ssl.webflow.com/6302549cb7ad659d9d1cdcca/6304cb305d6a63b12bcb78ca_Panadol_Obat_Sakit_Kepala_Extra-thumbnail-540x540.png"))),
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
              Text(item.harga.toString()),
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
        height: 200,
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
                  children: [const Text("Order"), Text(total.toString())],
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
                    const Text("Total"),
                    Text(((total * 0.10) + total).toString())
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
