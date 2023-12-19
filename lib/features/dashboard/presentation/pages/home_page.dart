import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/dashboard/presentation/pages/select_obat_page.dart';
import 'package:apotik/features/product/presentation/pages/detail_product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:need_resume/need_resume.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ResumableState<HomePage> {
  @override
  void onReady() {
    // Implement your code inside here

    print('HomeScreen is ready!');
  }

  @override
  void onResume() {
    // Implement your code inside here

    print('HomeScreen is resumed!');
  }

  @override
  void onPause() {
    // Implement your code inside here

    print('HomeScreen is paused!');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController();

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "ApotikQU",
      //     style: headlineStyleText(),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(color: ColorStyle.primaryColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(MediaQuery.of(context).size.height / 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1699287311~exp=1699287911~hmac=1c6639970625e2ee21955b2362408a38c124110dac65e5604aabc93a2b5fb2e1"),
                            ),
                            Text(
                              "Hello, User",
                              style: titleStyleText(),
                            ),
                            Gap(MediaQuery.of(context).size.width / 2.5),
                            const CircleAvatar(
                              radius: 15,
                              child: Icon(
                                Icons.notifications,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(MediaQuery.of(context).size.height / 24),
                      Center(child: searchBar(context, searchText)),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 - 90,
                  left: 0,
                  right: 0,
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
                      // padEnds: true,
                      //height: 150,
                      aspectRatio: 16 / 9,
                      padEnds: true,
                      viewportFraction: 0.7,
                      animateToClosest: true,
                      pageSnapping: true,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
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
                      itemCount: 4,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: index == 0
                            ? GestureDetector(
                                onTap: () {
                                  push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SelectObatPage()));
                                },
                                child: const ChoiceChip(
                                    label: Text("Paracetamol"), selected: true),
                              )
                            : const ChoiceChip(
                                label: Text("Paracetamol"), selected: false),
                      ),
                    ),
                  ),
                  const Gap(10),
                  titleCard("Rekomendasi Untukmu", "Liha Semua"),
                  BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      if (state is DasboardLoading) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      if (state is DashboardSuccess) {
                        return Wrap(
                            spacing: 8.0, // gap between adjacent chips
                            runSpacing: 4.0,
                            direction: Axis.horizontal,
                            children: List.generate(
                              state.product.length - 10,
                              (index) => Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Hero(
                                  tag: 'product$index',
                                  child: GestureDetector(
                                    onTap: () => push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailProductPage(
                                                  index: index,
                                                  productEntity:
                                                      state.product[index]),
                                        )),
                                    child: card(
                                        state.product[index].thumbnail,
                                        state.product[index].description,
                                        state.product[index].price.toString(),
                                        () {}),
                                  ),
                                ),
                              ),
                            ));
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
                  titleCard("Terlaris Bulan Ini", "Liha Semua"),
                  Wrap(
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0,
                      direction: Axis.horizontal,
                      children: List.generate(
                        8,
                        (index) => Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: card(
                              "https://images.k24klik.com/product/0104k0131.jpg",
                              "Paracetamol",
                              "Rp. 10.000",
                              () {}),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget searchBar(
    BuildContext context, TextEditingController textEditingController) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.05,
    height: MediaQuery.of(context).size.height / 16,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14)),
    child: Row(
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
            ),
          ),
        ),
      ],
    ),
  );
}

Widget card(String image, String title, String price, VoidCallback onTap) {
  return Container(
    width: 150,
    height: 350,
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
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(image, height: 100)),
        const Gap(14),
        SizedBox(
          width: double.maxFinite,
          height: 150,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
          child: SizedBox(
            child: CustomOutlineButton(
                function: onTap,
                child: Text(
                  "+ Tambah",
                  style:
                      titleStyleText().copyWith(color: ColorStyle.primaryColor),
                )),
          ),
        )
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
