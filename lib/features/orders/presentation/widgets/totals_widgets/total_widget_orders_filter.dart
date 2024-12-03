import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/utils/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../app/app.dart';
import '../../../../../configs/app_colors.dart';
import '../../../../../core/utils/general_funs/g_fun_date_picker.dart';
import '../../../../../core/utils/general_widgets/g_widget_drop_down.dart';

class TotalWidgetOrdersFilter extends StatelessWidget {
  const TotalWidgetOrdersFilter(
      {super.key,
      required this.dateTime,
      required this.onPickDate,
      this.orderStatus,
      required this.onOrderStatusChanged});
  final DateTime dateTime;
  final OrderStatus? orderStatus;
  final Function(DateTime? date) onPickDate;
  final Function(int index) onOrderStatusChanged;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        floating: false,
        snap: false,
        expandedHeight: 180,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        titleSpacing: 180,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: App.paddingLR, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Orders',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 20)),
                      Expanded(
                        child: GWidgetDropDown(
                            items: const [
                              'All',
                              'Ordered',
                              'Deliver',
                              'Returned'
                            ],
                            dropdownValue: orderStatus == null
                                ? 'All'
                                : orderStatus == OrderStatus.delivered
                                    ? 'Deliver'
                                    : orderStatus == OrderStatus.ordered
                                        ? 'Ordered'
                                        : 'Returned',
                            title: 'Status',
                            onChanged: onOrderStatusChanged),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () async {
                              final data =
                                  await GFunDatePicker(context: context)
                                      .getDateTime(
                                          firstlDate: DateTime(2005),
                                          initialDate: dateTime);
                              onPickDate(data);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.4))),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Text(
                                    DateFormat('MM/dd/yyy').format(dateTime),
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.2),
                    height: 20,
                  ),
                  const Center(
                    child: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ));
  }
}
