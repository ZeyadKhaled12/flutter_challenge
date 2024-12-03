import 'package:flutter/material.dart';

import '../../../app/app.dart';

class GWidgetDrawerIcon extends StatelessWidget {
  const GWidgetDrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        App.scaffoldKey.currentState!.openDrawer();
      },
      child: const Padding(
        padding: EdgeInsets.only(bottom: 24),
        child: Icon(
          Icons.menu,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}
