import 'package:flutter/material.dart';
import '../../../orders/presentation/screens/graph_screen.dart';
import '../../../orders/presentation/screens/totals_screen.dart';
import '../widgets/main_widgets/main_widget_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexChosen = 0;
  final List<Widget> screens = [const TotalsScreen(), const GraphScreen()];
  @override
  Widget build(BuildContext context) {
    return MainWidgetBody(
      indexChosen: indexChosen,
      screens: screens,
      onChooseScreen: (index) {
        setState(() {
          indexChosen = index;
        });
      },
    );
  }
}
