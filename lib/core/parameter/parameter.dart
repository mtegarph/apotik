import 'package:equatable/equatable.dart';

//di class ini yang meng handle jika ada parameter di api untuk update data
class ParameterUpdate extends Equatable {
  final String name;
  final String email;
  final String? noHp;

  const ParameterUpdate({required this.name, required this.email, this.noHp});
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, noHp];
}
