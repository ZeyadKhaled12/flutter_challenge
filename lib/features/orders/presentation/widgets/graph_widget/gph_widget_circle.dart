import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/order_format_date.dart';
import '../../../data/models/order_format_time.dart';

class GphWidgetCircle extends StatelessWidget {
  final List<OrderFormatTime> dataTime;
  final List<OrderFormatDate> dataDate;
  final bool isTime;

  const GphWidgetCircle(
      {super.key,
      required this.dataTime,
      required this.isTime,
      required this.dataDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0XFF2E2E32),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SfCircularChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries>[
          !isTime
              ? PieSeries<OrderFormatDate, String>(
                  dataSource: dataDate,
                  xValueMapper: (OrderFormatDate order, _) => order.month,
                  yValueMapper: (OrderFormatDate order, _) => order.count,
                  dataLabelMapper: (OrderFormatDate order, _) =>
                      '${order.month}: ${order.count}',
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  enableTooltip: true,
                  explode: true,
                  explodeIndex: 0,
                  animationDuration: 1500,
                )
              : PieSeries<OrderFormatTime, String>(
                  dataSource: dataTime,
                  xValueMapper: (OrderFormatTime order, _) =>
                      order.timeOfDay.format(context),
                  yValueMapper: (OrderFormatTime order, _) => order.count,
                  dataLabelMapper: (OrderFormatTime order, _) =>
                      '${order.timeOfDay.format(context)}: ${order.count}',
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  enableTooltip: true,
                  explode: true,
                  explodeIndex: 0,
                  animationDuration: 1500,
                ),
        ],
      ),
    );
  }
}
