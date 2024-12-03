import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/base_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../../data/models/order_model.dart';
import '../../domain/usecases/get_orders_uc.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUc getOrdersUc;
  OrdersBloc(this.getOrdersUc) : super(const OrdersState()) {
    on<GetOrdersEvent>(_getOrders);
  }

  FutureOr<void> _getOrders(
      GetOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(state.copyWith(ordersRequestState: RequestState.loading));
    final result = await getOrdersUc.call(event.noParameters);
    result.fold(
        (l) => emit(state.copyWith(ordersRequestState: RequestState.error)),
        (r) => emit(state.copyWith(
            ordersRequestState: RequestState.loaded, orders: r)));
  }
}
