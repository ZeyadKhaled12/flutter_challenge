import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../features/orders/data/models/order_format_date.dart';
import '../../../features/orders/data/models/order_format_time.dart';
import '../../../features/orders/data/models/order_model.dart';

const Map<String, int> monthIndices = {
  'Jan': 1,
  'Feb': 2,
  'Mar': 3,
  'Apr': 4,
  'May': 5,
  'Jun': 6,
  'Jul': 7,
  'Aug': 8,
  'Sep': 9,
  'Oct': 10,
  'Nov': 11,
  'Dec': 12,
};

class GFunGraph {
  final List<OrderModel> orders;
  final BuildContext context;

  GFunGraph({required this.orders, required this.context});
  List<OrderFormatTime> formatOrderTimes(final int year, bool isAm) {
    Map<TimeOfDay, int> ordersUbdate = {};
    List<OrderFormatTime> dFormat = [];
    for (var element in orders) {
      if (element.registered != null) {
        if (element.registered!.year == year) {
          TimeOfDay key = TimeOfDay.fromDateTime(element.registered!);
          ordersUbdate[key] = (ordersUbdate[key] ?? 0) + 1;
        }
      }
    }
    ordersUbdate.forEach((key, value) {
      dFormat.add(OrderFormatTime(timeOfDay: key, count: value));
    });
    dFormat.sort((a, b) => (a.timeOfDay.hour + a.timeOfDay.minute / 60.0)
        .compareTo(b.timeOfDay.hour + b.timeOfDay.minute / 60.0));

    dFormat.removeWhere((element) {
      String date = element.timeOfDay.format(context);
      date = date.substring(date.length - 2, date.length - 1);
      if (isAm) {
        if (date == 'P') return true;
      } else {
        if (date == 'A') return true;
      }
      return false;
    });
    return dFormat;
  }

  List<OrderFormatDate> formatOrderDates(final int year) {
    Map<String, int> ordersUbdate = {};
    List<OrderFormatDate> dFormat = [];
    for (var element in orders) {
      if (element.registered != null) {
        if (element.registered!.year == year) {
          String key = DateFormat('MMM').format(element.registered!);
          ordersUbdate[key] = (ordersUbdate[key] ?? 0) + 1;
        }
      }
    }
    ordersUbdate.forEach((key, value) {
      dFormat.add(OrderFormatDate(month: key, count: value));
    });
    dFormat.sort(
        (a, b) => monthIndices[a.month]!.compareTo(monthIndices[b.month]!));
    return dFormat;
  }
}
