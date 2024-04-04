import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product_search.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_transaksi.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaksi_history_event.dart';
part 'transaksi_history_state.dart';

class TransaksiHistoryBloc
    extends Bloc<TransaksiHistoryEvent, TransaksiHistoryState> {
  final GetTransaksiUseCase getProductUseCase;
  TransaksiHistoryBloc(this.getProductUseCase) : super(TransaksiHistoryInitial()) {
    on<GetTransaksi>(_onGetProduct);
  }
  void _onGetProduct(
      GetTransaksi event, Emitter<TransaksiHistoryState> emit) async {
    emit(TransaksiHistoryLoading());
    final result = await getProductUseCase.call(params: event.idCustomer);
    result.fold((l) => emit(TransaksiHistoryFailed(message: l.message)),
        (r) => emit(TransaksiHistorySuccess(products: r)));
  }
}
