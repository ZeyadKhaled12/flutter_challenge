import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/utils/enums.dart';
import '../../../../../core/utils/general_widgets/g_widget_loading.dart';
import '../../../data/models/order_model.dart';
import 'total_widget_orders.dart';
import 'total_widget_orders_filter.dart';
import 'totals_widget_top.dart';

class TotalsBody extends StatefulWidget {
  const TotalsBody(
      {super.key,
      required this.isLoading,
      required this.orders,
      required this.disableAnimation});
  final bool isLoading;
  final bool disableAnimation;
  final List<OrderModel> orders;

  @override
  State<TotalsBody> createState() => _TotalsBodyState();
}

class _TotalsBodyState extends State<TotalsBody> {
  DateTime dateTime = DateTime.now();
  OrderStatus? orderStatus;
  @override
  Widget build(BuildContext context) {
    return GWidgetLoading(
        isLoading: widget.isLoading,
        body: CustomScrollView(
          slivers: [
            TotalsWidgetTop(
                disableAnimation: widget.disableAnimation,
                isLoaindg: widget.isLoading,
                orders: widget.orders),
            TotalWidgetOrdersFilter(
              dateTime: dateTime,
              orderStatus: orderStatus,
              onPickDate: (date) {
                if (date != null) {
                  setState(() {
                    dateTime = date;
                  });
                }
              },
              onOrderStatusChanged: (index) {
                if (index == 0) orderStatus = null;
                if (index == 1) orderStatus = OrderStatus.ordered;
                if (index == 2) orderStatus = OrderStatus.delivered;
                if (index == 3) orderStatus = OrderStatus.returned;
                setState(() {});
              },
            ),
            TotalWidgetOrders(
              orders: widget.orders,
              dateTime: dateTime,
              orderStatus: orderStatus,
            ),
          ],
        ));
  }
}
