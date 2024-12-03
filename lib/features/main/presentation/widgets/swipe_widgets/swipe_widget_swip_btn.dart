import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/orders/presentation/screens/totals_screen.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../app/app.dart';
import '../../../../../configs/app_colors.dart';
import '../../screens/main_screen.dart';

class SwipeWidgetSwipBtn extends StatelessWidget {
  const SwipeWidgetSwipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return App.isWeb
        ? InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TotalsScreen(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 19),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.secondary,
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        : SwipeButton.expand(
            thumb: const Icon(
              Icons.keyboard_double_arrow_right_outlined,
              color: Colors.white,
            ),
            activeThumbColor: AppColors.secondary,
            activeTrackColor: Colors.white,
            onSwipe: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ));
            },
            child: Text(
              'Swipe to get started',
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          );
  }
}
