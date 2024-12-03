import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../app/app.dart';
import '../../../../../configs/app_colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/general_widgets/g_widget_drawer_icon.dart';
import '../../../data/models/order_model.dart';
import 'totals_widget_card_count.dart';

class TotalsWidgetTop extends StatelessWidget {
  const TotalsWidgetTop(
      {super.key,
      required this.orders,
      required this.isLoaindg,
      required this.disableAnimation});
  final List<OrderModel> orders;
  final bool disableAnimation;
  final bool isLoaindg;

  @override
  Widget build(BuildContext context) {
    final data = getTotals(orders);
    return SliverAppBar(
      pinned: false,
      floating: false,
      expandedHeight:
          App.isWeb ? 590 : MediaQuery.of(context).size.height * 2 / 3,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.only(top: 69),
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: App.paddingLR),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (App.isWeb) const GWidgetDrawerIcon(),
                    Text(
                      'Total Price',
                      style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.6), fontSize: 12.5),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    Text(
                      '\$${data.$1.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                      height: 40,
                    ),
                    Text(
                      'Totals',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              if (!isLoaindg)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TotalsWidgetCardCount(
                      title: 'Total Count',
                      disabledAnimation: disableAnimation,
                      width: MediaQuery.of(context).size.width * 2 / 2.4,
                      value: data.$2.toDouble(),
                      color: const Color(0XFFc1dceb),
                      isCeil: true,
                    ),
                    TotalsWidgetCardCount(
                      title: 'Average Price',
                      symbol: '\$',
                      disabledAnimation: disableAnimation,
                      width: MediaQuery.of(context).size.width * 2 / 2.6,
                      value: data.$3.toDouble(),
                      color: const Color(0XFFebd6d6),
                      isCeil: false,
                    ),
                    TotalsWidgetCardCount(
                      title: 'Number Of Returns',
                      disabledAnimation: disableAnimation,
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      value: data.$4.toDouble(),
                      color: const Color(0XFFfcf4e1),
                      isCeil: true,
                    ),
                  ],
                ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
            ],
          ),
        ),
      ),
    );
  }
}

(double, int, double, int) getTotals(List<OrderModel> orders) {
  double totalPrices = 0;
  int totalCount = orders.length;
  double avPrice = 0;
  int returns = 0;
  for (var element in orders) {
    totalPrices = totalPrices + (element.price ?? 0);
    if (element.status == OrderStatus.returned) {
      returns++;
    }
  }
  avPrice = totalPrices / totalCount;
  return (totalPrices, totalCount, avPrice, returns);
}
