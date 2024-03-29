part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends DashboardEvent {
  final String params;
  const GetProductEvent(this.params);
}
