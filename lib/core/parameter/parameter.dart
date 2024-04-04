import 'dart:io';

import 'package:equatable/equatable.dart';

//di class ini yang meng handle jika ada parameter di api untuk update data
class ParameterUpdate extends Equatable {
  final String name;
  final String password;
  final String? noHp;

  const ParameterUpdate(
      {required this.name, required this.password, this.noHp});
  @override
  // TODO: implement props
  List<Object?> get props => [name, password, noHp];
}

class ParameterTransaksi extends Equatable {
  final int noTransaksi;
  final String statusTransaksi;
  final File image;

  const ParameterTransaksi(
      {required this.noTransaksi,
      required this.statusTransaksi,
      required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [noTransaksi, statusTransaksi, image];
}
