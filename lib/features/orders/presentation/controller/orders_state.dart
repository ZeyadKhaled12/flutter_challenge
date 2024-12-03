part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final List<OrderModel> orders;
  final RequestState ordersRequestState;

  const OrdersState({
    this.orders = const [],
    this.ordersRequestState = RequestState.loaded,
  });

  OrdersState copyWith(
      {List<OrderModel>? orders, RequestState? ordersRequestState}) {
    return OrdersState(
        orders: orders ?? this.orders,
        ordersRequestState: ordersRequestState ?? this.ordersRequestState);
  }

  @override
  List<Object> get props => [
        orders,
        ordersRequestState,
      ];
}
