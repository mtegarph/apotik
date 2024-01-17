import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:apotik/features/product/presentation/bloc/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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

class HistoryProcessPage extends StatelessWidget {
  const HistoryProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<DashboardBloc, DashboardState>(
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
                  state.product.length,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          card(
                            context,
                            state.product[index].namaObat.toString(),
                            state.product[index].isiPerkemasan.toString(),
                            state.product[index].harga.toString(),
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
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
          if (state is DashboardFailed) {
            return Center(
              child: Text(state.message.toString()),
            );
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
                Text("Rp $price",
                    style: titleStyleText().copyWith(color: Colors.grey[600])),
              ],
            )
          ],
        )
      ],
    );
  }
}
