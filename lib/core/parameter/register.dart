import 'package:equatable/equatable.dart';

class ParameterRegister extends Equatable {
  final String name;
  final String password;
  final String? noHp;
  final String email;
  final String alamat;
  final String username;

  const ParameterRegister({
    required this.name,
    required this.password,
    required this.noHp,
    required this.email,
    required this.alamat,
    required this.username,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, password, noHp];
}
