import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/app.dart';
import '../../../../configs/app_colors.dart';

import '../../../main/presentation/widgets/main_widgets/main_widget_drawer.dart';
import '../controller/orders_bloc.dart';
import '../widgets/graph_widget/graph_body.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        drawer: const MainWidgetDrawer(
          indexScreen: 1,
        ),
        key: App.scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: AppColors.primary,
            )),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          buildWhen: (previous, current) =>
              previous.ordersRequestState != current.ordersRequestState,
          builder: (context, state) {
            return GraphBody(orders: state.orders);
          },
        ));
  }
}
