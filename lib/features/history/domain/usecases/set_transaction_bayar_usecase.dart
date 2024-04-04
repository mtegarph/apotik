import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/history/domain/repositories/transaction_detail_repo.dart';
import 'package:dartz/dartz.dart';

class SetTransaksiBayarUseCase
    implements UseCase<Either<Failure, bool>, ParameterTransaksi> {
  final TransactionDetailRepo transactionDetailRepo;

  SetTransaksiBayarUseCase({required this.transactionDetailRepo});

  @override
  Future<Either<Failure, bool>> call({ParameterTransaksi? params}) {
    // TODO: implement call
    return transactionDetailRepo.sentTransaksi(parameter: params!);
  }
}
