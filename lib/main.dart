import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'core/services/services_locator.dart';
import 'features/main/presentation/screens/swipe_screen.dart';
import 'features/orders/presentation/controller/orders_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<OrdersBloc>()),
      ],
      child: MaterialApp(
        title: 'Fintech',
        navigatorKey: App.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const SwipeScreen(),
      ),
    );
  }
}
