import 'package:circular_gradient_spinner/circular_gradient_spinner.dart';
import 'package:flutter/material.dart';
import '../../../configs/app_colors.dart';
import '../assets_manager.dart';

class GWidgetLoadingCircle extends StatelessWidget {
  const GWidgetLoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularGradientSpinner(
          color: AppColors.secondary,
          duration: Duration(seconds: 1),
          size: 60,
          strokeWidth: 8,
        ),
        Image.asset(
          ImgAsset.logo,
          color: AppColors.secondary,
          width: 40,
          height: 40,
        )
      ],
    );
  }
}
