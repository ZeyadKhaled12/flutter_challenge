import 'package:flutter/material.dart';
import 'package:flutter_challenge/configs/app_colors.dart';
import 'package:flutter_challenge/core/utils/assets_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import '../../../../orders/presentation/screens/graph_screen.dart';
import '../../../../orders/presentation/screens/totals_screen.dart';

class MainWidgetDrawer extends StatelessWidget {
  const MainWidgetDrawer({super.key, required this.indexScreen});
  final int indexScreen;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Drawer(
          backgroundColor: AppColors.primary.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      'FinTechs App',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Image.asset(ImgAsset.logo, width: 50, height: 50)
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.2),
                height: 20,
                thickness: 0.5,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 25)),
              MenuOption(
                text: 'Home',
                isCheck: indexScreen == 0,
                iconData: Icons.home,
                onPressed: () async {
                  if (indexScreen != 0) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TotalsScreen(),
                        ));
                  }
                },
              ),
              const DividerWidget(),
              MenuOption(
                text: 'Charts',
                isCheck: indexScreen == 1,
                iconData: Icons.pie_chart_sharp,
                onPressed: () async {
                  if (indexScreen != 1) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GraphScreen(),
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 20,
      color: Colors.white,
    );
  }
}

class MenuOption extends StatelessWidget {
  const MenuOption(
      {super.key,
      required this.text,
      this.iconData,
      this.padding = 35,
      required this.isCheck,
      required this.onPressed});
  final String text;
  final IconData? iconData;
  final bool isCheck;
  final double padding;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isCheck ? const EdgeInsets.only(top: 10, bottom: 10) : null,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: isCheck
          ? const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100)))
          : null,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(right: 20)),
              Icon(iconData,
                  size: 25, color: isCheck ? Colors.black : Colors.white),
              const Padding(padding: EdgeInsets.only(right: 15)),
              Text(
                text,
                style: GoogleFonts.poppins(
                    color: isCheck ? Colors.black : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
