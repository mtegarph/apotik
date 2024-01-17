import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_detail_product.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetProductUseCase getProductUseCase;

  DashboardBloc(this.getProductUseCase) : super(DashboardInitial()) {
    on<GetProductEvent>(_onGetProduct);
  }

  void _onGetProduct(
      GetProductEvent event, Emitter<DashboardState> emit) async {
    emit(DasboardLoading());
    final result = await getProductUseCase.call(params: event.params);
    result.fold((l) => emit(DashboardFailed(message: l.message)),
        (r) => emit(DashboardSuccess(product: r)));
  }
}
