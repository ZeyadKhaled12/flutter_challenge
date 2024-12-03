import 'package:flutter/material.dart';

import 'g_widget_loading_circle.dart';

class GWidgetLoading extends StatelessWidget {
  const GWidgetLoading(
      {super.key,
      required this.isLoading,
      required this.body,
      this.opacity = 0.28});
  final bool isLoading;
  final double opacity;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Opacity(opacity: isLoading ? opacity : 1, child: body),
        if (isLoading)
          const Center(
            child: GWidgetLoadingCircle(),
          )
      ],
    );
  }
}
