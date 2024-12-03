import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/app/app.dart';
import 'package:flutter_challenge/features/main/presentation/widgets/main_widgets/main_widget_drawer.dart';
import '../../../../configs/app_colors.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../controller/orders_bloc.dart';
import '../widgets/totals_widgets/totals_body.dart';

class TotalsScreen extends StatefulWidget {
  const TotalsScreen({super.key});

  @override
  State<TotalsScreen> createState() => _TotalsScreenState();
}

class _TotalsScreenState extends State<TotalsScreen> {
  bool disableAnimation = false;
  @override
  void initState() {
    if (context.read<OrdersBloc>().state.orders.isEmpty) {
      context
          .read<OrdersBloc>()
          .add(const GetOrdersEvent(noParameters: NoParameters()));
    } else {
      disableAnimation = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: App.scaffoldKey,
      drawer: const MainWidgetDrawer(
        indexScreen: 0,
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: AppColors.primary,
          )),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        buildWhen: (previous, current) =>
            previous.ordersRequestState != current.ordersRequestState,
        builder: (context, state) {
          return TotalsBody(
            isLoading: state.ordersRequestState == RequestState.loading,
            disableAnimation: disableAnimation,
            orders: state.orders,
          );
        },
      ),
    );
  }
}
