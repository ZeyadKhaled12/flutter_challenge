import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/app.dart';
import 'package:flutter_challenge/core/utils/enums.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/order_model.dart';

class TotalWidgetOrders extends StatelessWidget {
  const TotalWidgetOrders(
      {super.key, required this.orders, this.dateTime, this.orderStatus});
  final List<OrderModel> orders;
  final DateTime? dateTime;
  final OrderStatus? orderStatus;

  @override
  Widget build(BuildContext context) {
    List<OrderModel> ordersD = List.from(orders);
    if (dateTime != null) {
      ordersD.removeWhere(
        (element) =>
            dateTime!.difference(element.registered ?? DateTime.now()).inDays <
            0,
      );
    }
    if (orderStatus != null) {
      ordersD.removeWhere(
        (element) => element.status != orderStatus,
      );
    }
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Padding(
          padding: EdgeInsets.only(
              bottom: index == ordersD.length - 1 ? App.bottomHeight : 0),
          child: OrderWidget(orderModel: ordersD[index]));
    }, childCount: ordersD.length));
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(
          top: 28, left: App.paddingLR, right: App.paddingLR),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: orderModel.picture == null
                ? null
                : NetworkImage(orderModel.picture!),
            radius: 28,
          ),
          const Padding(padding: EdgeInsets.only(right: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        orderModel.buyer ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.5),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            (orderModel.isActive ?? false)
                                ? 'Active'
                                : 'Not Active',
                            style: GoogleFonts.poppins(
                              color: (orderModel.isActive ?? false)
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            )),
                        const Padding(padding: EdgeInsets.only(right: 4)),
                        (orderModel.isActive ?? false)
                            ? const Icon(Icons.check,
                                color: Colors.green, size: 20)
                            : const Icon(Icons.clear,
                                color: Colors.red, size: 20)
                      ],
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                Flexible(
                  child: Text(
                    orderModel.tags.toString().substring(1),
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
