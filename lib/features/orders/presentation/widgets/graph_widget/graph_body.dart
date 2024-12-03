import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/app.dart';
import '../../../../../core/utils/general_funs/g_fun_graph.dart';
import '../../../../../core/utils/general_widgets/g_widget_drop_down.dart';
import '../../../data/models/order_model.dart';
import 'gph_widget_circle.dart';
import 'gph_widget_linear.dart';
import 'gph_widget_top.dart';

class GraphBody extends StatefulWidget {
  const GraphBody({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  State<GraphBody> createState() => _GraphBodyState();
}

class _GraphBodyState extends State<GraphBody> {
  late GFunGraph gFunGraph;
  Set<int> years = {};
  int indexYear = 0;
  int indexOpt = 0;
  int indexAm = 0;

  @override
  void initState() {
    gFunGraph = GFunGraph(orders: List.from(widget.orders), context: context);
    for (var element in widget.orders) {
      if (element.registered != null) {
        years.add(element.registered!.year);
      }
    }
    final data = years.toList()..sort();
    years = Set.from(data.toSet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: App.paddingLR),
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          GphWidgetTop(
            indexOpt: indexOpt,
            indexAM: indexAm,
            onChooseAm: (index) {
              setState(() {
                indexAm = index;
              });
            },
            onChoose: (index) {
              setState(() {
                indexOpt = index;
              });
            },
          ),
          SizedBox(
            width: 90,
            child: GWidgetDropDown(
                items: years.toList().map((e) => e.toString()).toList(),
                dropdownValue: years.elementAt(indexYear).toString(),
                onChanged: (index) {
                  setState(() {
                    indexYear = index;
                  });
                }),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 15)),
          GphWidgetLinear(
              isTime: indexOpt == 1,
              dataTime: gFunGraph.formatOrderTimes(
                  years.elementAt(indexYear), indexAm == 0),
              dataDate: gFunGraph.formatOrderDates(years.elementAt(indexYear))),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          GphWidgetCircle(
              isTime: indexOpt == 1,
              dataTime: gFunGraph.formatOrderTimes(
                  years.elementAt(indexYear), indexAm == 0),
              dataDate: gFunGraph.formatOrderDates(years.elementAt(indexYear))),
          const Padding(
              padding: EdgeInsets.only(bottom: App.bottomHeight + 25)),
        ],
      ),
    );
  }
}
