import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/product/domain/usecases/set_transaksi_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_transaksi_event.dart';
part 'set_transaksi_state.dart';

class SetTransaksiBloc extends Bloc<SetTransaksiEvent, SetTransaksiState> {
  final SetTransaksiUseCase setTransaksiUseCase;
  SetTransaksiBloc(this.setTransaksiUseCase) : super(SetTransaksiInitial()) {
    on<SetTransaksi>(_setTransaksi);
  }
  void _setTransaksi(
      SetTransaksi event, Emitter<SetTransaksiState> emit) async {
    emit(SetTransaksiLoading());
    final result =
        await setTransaksiUseCase.call(params: event.transaksiEntity);
    result.fold((l) => emit(SetTransaksiFailed(message: l.message)),
        (r) => emit(SetTransaksiSuccess()));
  }
}
