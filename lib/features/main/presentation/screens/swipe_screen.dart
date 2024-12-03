import 'package:flutter/material.dart';

import '../../../../app/app.dart';
import '../../../../configs/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/swipe_widgets/swipe_widget_swip_btn.dart';
import '../widgets/swipe_widgets/swipe_widget_text.dart';

class SwipeScreen extends StatelessWidget {
  const SwipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: App.paddingLR),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: App.isWeb
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              if (App.isWeb)
                const SizedBox(
                  height: 40,
                ),
              App.isWeb
                  ? const Center(
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(ImgAsset.welcome),
                      ),
                    )
                  : Image(
                      image: const AssetImage(ImgAsset.welcome),
                      height: MediaQuery.of(context).size.height * 1 / 1.8,
                    ),
              const SwipeWidgetText(),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              const SwipeWidgetSwipBtn(),
              if (App.isWeb)
                const SizedBox(
                  height: 40,
                ),
            ],
          ),
        ),
        backgroundColor: AppColors.primary);
  }
}
