import 'package:apotik/config/theme/app_theme.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:supercharged/supercharged.dart';

class SelectObatPage extends StatelessWidget {
  const SelectObatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MultiSelectController<ProductEntity> _controller =
        MultiSelectController();
    final List<ValueItem> _selectedOptions = [];
    final List<String> _selectedOptionsName = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih Jenis Obat",
          style: headlineStyleText(),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.primaryColor),
              onPressed: () {},
              child: Text("Cari Obat",
                  style: titleStyleText().copyWith(color: Colors.white)))),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Pilih Jenis Obat atau Penyakit yang Anda Cari",
              style: titleStyleText()),
          const Gap(20),
          Text(
            "Pilih Penyakit yang anda derita",
            style: titleStyleText(),
          ),
          const Gap(10),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DasboardLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is DashboardSuccess) {
                return MultiSelectDropDown<ProductEntity>(
                  //showClearIcon: true,
                  onOptionSelected: (options) {
                    // debugPrint(options.toString());
                    _selectedOptions.addAll(options);
                    _selectedOptions.forEach((e) {
                      _selectedOptionsName.add(e.label);
                    });
                    print(_selectedOptionsName.toJSON());
                  },
                  options: state.product
                      .map((e) =>
                          ValueItem(label: e.namaObat.toString(), value: e))
                      .toList(),
                  maxItems: 3,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(
                      wrapType: WrapType.wrap, backgroundColor: Colors.red),
                  dropdownHeight: 300,
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
          const Gap(20),
          Text(
            "Pilih Jenis Obat Yang Anda Inginkan",
            style: titleStyleText(),
          ),
          const Gap(10),
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DasboardLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is DashboardSuccess) {
                return MultiSelectDropDown<ProductEntity>(
                //  showClearIcon: true,
                  onOptionSelected: (options) {
                    // debugPrint(options.toString());
                    _selectedOptions.addAll(options);

                    print(_selectedOptions.map((e) => e.label));
                  },
                  options: state.product
                      .map((e) =>
                          ValueItem(label: e.namaObat.toString(), value: e))
                      .toList(),
                  maxItems: 3,
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(
                      wrapType: WrapType.wrap, backgroundColor: Colors.red),
                  dropdownHeight: 300,
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
          const Gap(20),
          // Text(
          //   "Pilih Penyakit yang anda derita",
          //   style: titleStyleText(),
          // ),
          // const Gap(10),
          // BlocBuilder<DashboardBloc, DashboardState>(
          //   builder: (context, state) {
          //     if (state is DasboardLoading) {
          //       return const Center(
          //         child: CupertinoActivityIndicator(),
          //       );
          //     }
          //     if (state is DashboardSuccess) {
          //       return MultiSelectDropDown<ProductEntity>(
          //         showClearIcon: true,
          //         onOptionSelected: (options) {
          //           // debugPrint(options.toString());
          //           _selectedOptions.addAll(options);

          //           print(_selectedOptions.map((e) => e.label));
          //         },
          //         options: state.product
          //             .map((e) => ValueItem(label: e.title, value: e))
          //             .toList(),
          //         maxItems: 3,
          //         selectionType: SelectionType.multi,
          //         chipConfig: const ChipConfig(
          //             wrapType: WrapType.wrap, backgroundColor: Colors.red),
          //         dropdownHeight: 300,
          //       );
          //     }
          //     if (state is DashboardFailed) {
          //       return Center(
          //         child: Text(state.message.toString()),
          //       );
          //     }
          //     return const SizedBox.shrink();
          //   },
          // ),
        ]),
      ),
    );
  }
}
