part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class GetOrdersEvent extends OrdersEvent {
  final NoParameters noParameters;

  const GetOrdersEvent({required this.noParameters});
}
