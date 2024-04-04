import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/history/domain/usecases/set_transaction_bayar_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_transaksi_event.dart';
part 'set_transaksi_state.dart';

class SetTransaksiBayarBloc
    extends Bloc<SetTransaksiBayarEvent, SetTransaksiBayarState> {
  final SetTransaksiBayarUseCase setTransaksiBayarUseCase;
  SetTransaksiBayarBloc(this.setTransaksiBayarUseCase)
      : super(SetTransaksiBayarInitial()) {
    on<SetTransaksiPayment>(_setTransaksiPayment);
  }
  void _setTransaksiPayment(
      SetTransaksiPayment event, Emitter<SetTransaksiBayarState> emit) async {
    emit(SetTransaksiBayarLoading());
    final result =
        await setTransaksiBayarUseCase.call(params: event.parameterTransaksi);
    result.fold((l) => emit(SetTransaksiBayarFailed(message: l.message)),
        (r) => emit(SetTransaksiBayarSuccess()));
  }
}
