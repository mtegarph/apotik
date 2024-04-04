// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:apotik/core/constant/constant.dart';
import 'package:apotik/features/login/data/models/local/local_login.dart';
import 'package:apotik/features/login/presentation/pages/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:need_resume/need_resume.dart';

import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/dependency_injection.dart';
import 'package:apotik/features/dashboard/presentation/bloc/bloc/product_search_bloc.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/dashboard/presentation/pages/search_product_page.dart';
import 'package:apotik/features/dashboard/presentation/pages/select_obat_page.dart';
import 'package:apotik/features/product/presentation/bloc/get_keranjang/get_keranjang_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/product_bloc.dart';
import 'package:apotik/features/product/presentation/pages/cart_view.dart';
import 'package:apotik/features/product/presentation/pages/detail_product.dart';

enum Category { merekObat, khasiat }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ResumableState<HomePage> {
  @override
  void onReady() {
    print('HomeScreen is ready!');
  }

  @override
  void onResume() {
    // Implement your code inside here
    context.read<GetKeranjangBloc>().add(GetKeranjang());
    print('HomeScreen is resumed!');
  }

  @override
  void onPause() {
    // Implement your code inside here
    print('HomeScreen is paused!');
  }

  List<Penyakit> penyakit = [
    Penyakit(penyakit: "Flu", active: false),
    Penyakit(penyakit: "Batuk", active: false),
    Penyakit(penyakit: "Demam", active: false),
    Penyakit(penyakit: "Pusing", active: false)
  ];
  Category? _category = Category.merekObat;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController();

    final List<String> imgList = [
      'https://www.k24klik.com/blog/wp-content/uploads/2019/03/PROMO-DISKON-copy.jpg',
      'https://promo.nos.jkt-1.neo.id/347568.jpg',
      'https://img.ws.mms.shopee.co.id/id-11134210-7qul4-lk64v5ib7q0v43',
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     width: double.infinity,
              //     child: Align(
              //       alignment: Alignment.centerRight,
              //       child: TextButton(
              //           onPressed: () {
              //             push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (context) => const LoginPage()));
              //           },
              //           child: const Text(
              //             "Login",
              //             style: TextStyle(color: Colors.blue),
              //           )),
              //     )),
              Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(color: ColorStyle.primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(MediaQuery.of(context).size.height / 50),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: GestureDetector(
                        //         onTap: () {
                        //           push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       const LoginPage()));
                        //         },
                        //         child: const Text(
                        //           "Login",
                        //           style: TextStyle(color: Colors.black),
                        //         )),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699287311~exp=1699287911~hmac=1c6639970625e2ee21955b2362408a38c124110dac65e5604aabc93a2b5fb2e1"),
                              ),
                              const Gap(10),
                              FutureBuilder(
                                  future:
                                      GetIt.instance<LocalLogin>().getNama(),
                                  builder: (context, snapshot) {
                                    return snapshot.data == "null"
                                        ? Text(
                                            "Hello, User",
                                            style: titleStyleText(),
                                          )
                                        : SizedBox(
                                            width: 130,
                                            child: Text(
                                              "Hello, ${snapshot.data}",
                                              style: titleStyleText(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          );
                                  }),
                              Gap(MediaQuery.of(context).size.width / 4.5),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<GetKeranjangBloc>()
                                      .add(GetKeranjang());
                                  push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartView()));
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const Gap(8),
                              GestureDetector(
                                onTap: () {
                                  push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.login,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(MediaQuery.of(context).size.height / 24),
                        Center(
                            child: searchBar(context, searchText, (p0) {
                          context.read<ProductSearchBloc>().add(ProductSearch(
                              keyword: p0,
                              searchBy: _category.toString().split('.').last));
                          push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchProductPage()));
                        },
                                Row(
                                  children: [
                                    Expanded(
                                      child: RadioListTile<Category>(
                                        activeColor: ColorStyle.primaryColor,
                                        title: const Text("Obat"),
                                        value: Category.merekObat,
                                        groupValue: _category,
                                        onChanged: (Category? value) {
                                          print(value);
                                          setState(() {
                                            _category = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<Category>(
                                        activeColor: ColorStyle.primaryColor,
                                        title: const Text("Penyakit"),
                                        value: Category.khasiat,
                                        groupValue: _category,
                                        onChanged: (Category? value) {
                                          setState(() {
                                            _category = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3 - 80,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: CarouselSlider(
                        items: imgList
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(e)),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          padEnds: true,
                          autoPlay: true,
                          viewportFraction: 0.7,
                          animateToClosest: true,
                          pageSnapping: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategori",
                      style: titleStyleText(),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: penyakit.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // if (penyakit[index].active == true) {
                              //   setState(() {
                              //     penyakit[index].active = false;
                              //   });
                              // }
                              setState(() {
                                penyakit[index].active =
                                    !penyakit[index].active;
                                //penyakit[index].active = true;
                              });
                              if (penyakit[index].active == true) {
                                context.read<DashboardBloc>().add(GetProductEvent(
                                    "/obat/khasiat/${penyakit[index].penyakit}"));
                              } else {
                                context
                                    .read<DashboardBloc>()
                                    .add(const GetProductEvent("/obat/umum/"));
                              }
                            },
                            child: ChoiceChip(
                                label: Text(penyakit[index].penyakit),
                                selected: penyakit[index].active),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    titleCard("Rekomendasi Untukmu", "Lihat Semua"),
                    BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        if (state is DasboardLoading) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        }
                        if (state is DashboardSuccess) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Wrap(
                                spacing: 50.0,
                                runSpacing: 20.0,
                                direction: Axis.horizontal,
                                children: List.generate(
                                  state.product.length,
                                  (index) => Hero(
                                    tag: 'product$index',
                                    child: GestureDetector(
                                      onTap: () {
                                        push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailProductPage(
                                                      idObat: state
                                                          .product[index]
                                                          .nroObat!,
                                                      index: index,
                                                      productEntity:
                                                          state.product[index]),
                                            ));
                                      },
                                      child: card(
                                          "${Urls.productBaseUrl}/${state.product[index].gambar}",
                                          state.product[index].merekObat
                                              .toString(),
                                          state.product[index].harga.toString(),
                                          () {}),
                                    ),
                                  ),
                                )),
                          );
                        }
                        if (state is DashboardFailed) {
                          return Center(
                            child: Text(state.message.toString()),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const Gap(10),
                    // titleCard("Terlaris Bulan Ini", "Liha Semua"),
                    // Wrap(
                    //     spacing: 8.0, // gap between adjacent chips
                    //     runSpacing: 4.0,
                    //     direction: Axis.horizontal,
                    //     children: List.generate(
                    //       8,
                    //       (index) => Padding(
                    //         padding: const EdgeInsets.all(17.0),
                    //         child: card(
                    //             "https://images.k24klik.com/product/0104k0131.jpg",
                    //             "Paracetamol",
                    //             "Rp. 10.000",
                    //             () {}),
                    //       ),
                    //     )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Penyakit {
  String penyakit;
  bool active;
  Penyakit({
    required this.penyakit,
    required this.active,
  });
}

Widget searchBar(
    BuildContext context,
    TextEditingController textEditingController,
    Function(String)? onSubmitted,
    Widget category) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.05,
    height: MediaQuery.of(context).size.height / 7.2,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(5),
            const Icon(
              Icons.search,
              size: 20,
            ),
            const Gap(5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: TextField(
                  style: titleStyleText().copyWith(fontSize: 12),
                  controller: textEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Silahkan Cari Obat Disini",
                      hintStyle: titleStyleText().copyWith(fontSize: 12)),
                  onSubmitted: onSubmitted,
                ),
              ),
            ),
          ],
        ),
        category
      ],
    ),
  );
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
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(8),
        //     child: Image.network(
        //       image,
        //     )),
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
          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
              .format(int.parse(price)),
          style: titleStyleText().copyWith(color: ColorStyle.primaryColor),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
        //   child: SizedBox(
        //     child: CustomOutlineButton(
        //         function: onTap,
        //         child: Text(
        //           "+ Tambah",
        //           style:
        //               titleStyleText().copyWith(color: ColorStyle.primaryColor),
        //         )),
        //   ),
        // )
      ],
    ),
  );
}

Widget titleCard(String title, String subTitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: titleStyleText(),
      ),
      Text(
        subTitle,
        style: titleStyleText().copyWith(color: ColorStyle.primaryColor),
      ),
    ],
  );
}
