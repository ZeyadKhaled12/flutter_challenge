import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

class MainWidgetBody extends StatelessWidget {
  const MainWidgetBody(
      {super.key,
      required this.indexChosen,
      required this.onChooseScreen,
      required this.screens});
  final int indexChosen;
  final Function(int index) onChooseScreen;
  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          screens[indexChosen],
          ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                height: App.bottomHeight,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(22))),
                child: Row(
                  children: [
                    IconBottomBar(
                        iconData: Icons.home_outlined,
                        iconDataClicked: Icons.home,
                        isClicked: indexChosen == 0,
                        isHome: indexChosen == 0,
                        text: 'Home',
                        onPressed: () => onChooseScreen(0)),
                    IconBottomBar(
                        iconData: Icons.pie_chart_outline_sharp,
                        iconDataClicked: Icons.pie_chart_sharp,
                        isClicked: indexChosen == 1,
                        isHome: indexChosen == 0,
                        text: 'Charts',
                        onPressed: () => onChooseScreen(1)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.iconData,
      required this.isClicked,
      required this.text,
      required this.iconDataClicked,
      required this.onPressed,
      required this.isHome});
  final IconData iconData;
  final IconData iconDataClicked;
  final bool isClicked;
  final String text;
  final bool isHome;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Color color =
        isHome ? Colors.black.withOpacity(0.4) : Colors.white.withOpacity(0.4);
    Color pickColor = isHome ? Colors.black : Colors.white;
    return Expanded(
        child: InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isClicked ? iconDataClicked : iconData,
            color: isClicked ? pickColor : color,
            size: isClicked ? 25 : 18,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
                color: isClicked ? pickColor : color,
                fontSize: 11.5,
                fontWeight: isClicked ? FontWeight.bold : FontWeight.w400),
          )
        ],
      ),
    ));
  }
}
