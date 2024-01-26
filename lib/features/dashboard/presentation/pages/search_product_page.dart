import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/features/dashboard/presentation/bloc/bloc/product_search_bloc.dart';
import 'package:apotik/features/product/presentation/pages/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:supercharged/supercharged.dart';

class SearchProductPage extends StatelessWidget {
  const SearchProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: "4D4D4D".toColor()),
          title: Text(
            "Hasil Pencarian",
            style: headlineStyleText(),
          ),
        ),
        body: BlocBuilder<ProductSearchBloc, ProductSearchState>(
          builder: (context, state) {
            if (state is ProductSearchLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (state is ProductSearchSuccess) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Wrap(
                        spacing: 50.0,
                        runSpacing: 20.0,
                        direction: Axis.horizontal,
                        children: List.generate(
                          state.products.length,
                          (index) => Hero(
                            tag: 'product$index',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailProductPage(
                                          idObat:
                                              state.products[index].nroObat!,
                                          index: index,
                                          productEntity: state.products[index]),
                                    ));
                              },
                              child: card(
                                  "${Urls.productBaseUrl}/${state.products[index].gambar}",
                                  state.products[index].merekObat.toString(),
                                  state.products[index].harga.toString(),
                                  () {}),
                            ),
                          ),
                        )),
                  ),
                ),
              );
            }
            if (state is ProductSearchFailed) {
              return Text(state.message.toString());
            }
            return SizedBox.shrink();
          },
        ));
  }

  Widget card(String image, String title, String price, VoidCallback onTap) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                color: Colors.grey,
                offset: Offset(0, 8))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          const Gap(14),
          SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Text(
              title,
              style: titleStyleText(),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            price,
            style: titleStyleText().copyWith(color: ColorStyle.primaryColor),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
          //   child: SizedBox(
          //     child: CustomOutlineButton(
          //         function: onTap,
          //         child: Text(
          //           "+ Tambah",
          //           style: titleStyleText()
          //               .copyWith(color: ColorStyle.primaryColor),
          //         )),
          //   ),
          // )
        ],
      ),
    );
  }
}
