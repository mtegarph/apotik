import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/config/theme/app_widget.dart';
import 'package:apotik/config/widgets/custom_rating_bar.dart';
import 'package:apotik/core/utils/size_utils.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class DetailProductPage extends StatelessWidget {
  final int index;
  final ProductEntity productEntity;
  const DetailProductPage(
      {super.key, required this.index, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: Stack(
        children: [
          Hero(
            tag: 'product$index',
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height / 2,
              imageUrl: productEntity.thumbnail.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Text(error.toString()),
              fit: BoxFit.cover, // Adjust the fit property as needed
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(productEntity.title,
                                              style: headlineStyleText()),
                                          SizedBox(height: 3.v),
                                          Row(children: [
                                            CustomRatingBar(
                                                margin: EdgeInsets.only(
                                                    bottom: 1.v),
                                                initialRating: 0),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.h),
                                                child: Text("4.5",
                                                    style: titleStyleText()))
                                          ])
                                        ]),
                                    const Spacer(),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 8.v, bottom: 10.v),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h, vertical: 1.v),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.h,
                                          ),
                                        ),
                                        child:
                                            Text("-", style: titleStyleText())),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.h, top: 9.v, bottom: 10.v),
                                        child: Text("14 Items",
                                            style: titleStyleText())),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10.h, top: 8.v, bottom: 10.v),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h, vertical: 1.v),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.h,
                                          ),
                                        ),
                                        child:
                                            Text("+", style: titleStyleText()))
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: titleStyleText(),
                              ),
                            ),
                            //SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 5),
                              child: Text(
                                "Bahan",
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: titleStyleText(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 3),
                              child: Text(
                                "seledri, tomat, sawi putih",
                                softWrap: true,
                                textAlign: TextAlign.justify,
                                style: titleStyleText(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
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
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 150,
              height: 50,
              child: CustomButton(
                  function: () {},
                  child: Text(
                    "Beli",
                    style: headlineStyleText().copyWith(color: Colors.white),
                  )),
            ),
          ],
        ),
      );
}
