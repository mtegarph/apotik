// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DasboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final List<ProductEntity> product;
  const DashboardSuccess({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class DashboardFailed extends DashboardState {
  final String message;
  const DashboardFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

