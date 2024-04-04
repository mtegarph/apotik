import 'package:apotik/features/history/domain/entities/transaction_detail_entity.dart';
import 'package:apotik/features/history/domain/usecases/get_transaction_detail_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class DetailTransaksiBloc
    extends Bloc<DetailTransaksiEvent, DetailTransaksiState> {
  final GetDetailTransaksiUseCase getDetailTransaksiUseCase;
  DetailTransaksiBloc(this.getDetailTransaksiUseCase)
      : super(HistoryInitial()) {
    on<GetDetailTransaksi>(_onGetDetailTransaksi);
  }
  void _onGetDetailTransaksi(
      GetDetailTransaksi event, Emitter<DetailTransaksiState> emit) async {
    emit(DetailTransaksiLoading());
    final result =
        await getDetailTransaksiUseCase.call(params: event.idTransaksi);
    result.fold((l) => emit(DetailTransaksiFailed(message: l.message)),
        (r) => emit(DetailTransaksiSuccess(products: r)));
  }
}
