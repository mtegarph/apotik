import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String id;
  final String email;
  final String fullname;

  const LoginEntity(
      {required this.id, required this.email, required this.fullname});

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, fullname];
}
