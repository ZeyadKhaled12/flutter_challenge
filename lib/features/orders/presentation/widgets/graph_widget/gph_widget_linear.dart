import 'package:flutter/material.dart';
import 'package:flutter_challenge/configs/app_colors.dart';
import 'package:flutter_challenge/features/orders/data/models/order_format_time.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/models/order_format_date.dart';

class GphWidgetLinear extends StatelessWidget {
  final List<OrderFormatDate> dataDate;
  final List<OrderFormatTime> dataTime;
  final bool isTime;

  const GphWidgetLinear(
      {super.key,
      required this.dataDate,
      required this.isTime,
      required this.dataTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.graphCard, borderRadius: BorderRadius.circular(15)),
      child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: CategoryAxis(
            title: AxisTitle(
                text: isTime ? 'Time' : 'Month',
                textStyle:
                    GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
            labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
                text: 'Order Count',
                textStyle:
                    GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
            labelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          series: <ChartSeries>[
            !isTime
                ? LineSeries<OrderFormatDate, String>(
                    dataSource: dataDate,
                    xValueMapper: (OrderFormatDate order, _) => order.month,
                    yValueMapper: (OrderFormatDate order, _) => order.count,
                    enableTooltip: true,
                    color: Colors.green,
                    width: 2,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      color: Colors.white,
                      borderColor: Colors.green,
                      borderWidth: 2,
                    ),
                    animationDuration: 1500,
                  )
                : LineSeries<OrderFormatTime, String>(
                    dataSource: dataTime,
                    xValueMapper: (OrderFormatTime order, _) =>
                        order.timeOfDay.format(context),
                    yValueMapper: (OrderFormatTime order, _) => order.count,
                    enableTooltip: true,
                    color: Colors.green,
                    width: 2,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      color: Colors.white,
                      borderColor: Colors.green,
                      borderWidth: 2,
                    ),
                    animationDuration: 1500,
                  )
          ]),
    );
  }
}
