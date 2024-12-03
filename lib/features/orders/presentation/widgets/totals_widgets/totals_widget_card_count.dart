import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app/app.dart';

class TotalsWidgetCardCount extends StatefulWidget {
  const TotalsWidgetCardCount(
      {super.key,
      required this.title,
      required this.value,
      required this.color,
      required this.isCeil,
      required this.width,
      this.symbol = '',
      this.disabledAnimation = false});
  final String title;
  final double value;
  final String symbol;
  final double width;
  final Color color;
  final bool isCeil;
  final bool disabledAnimation;

  @override
  State<TotalsWidgetCardCount> createState() => _TotalsWidgetCardCountState();
}

class _TotalsWidgetCardCountState extends State<TotalsWidgetCardCount> {
  bool isEnd = false;
  @override
  Widget build(BuildContext context) {
    int animation = 1500;
    return TweenAnimationBuilder<double>(
        onEnd: () {
          setState(() {
            isEnd = true;
          });
        },
        tween: Tween<double>(
            begin: widget.disabledAnimation ? widget.width : 0,
            end: widget.width),
        duration: Duration(milliseconds: animation),
        builder: (ctx, value, widget) {
          return Container(
            width: value,
            height: 80,
            padding: const EdgeInsets.only(left: App.paddingLR),
            decoration: BoxDecoration(
                color: this.widget.color,
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isEnd || this.widget.disabledAnimation)
                  Text(
                    this.widget.title,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: this.widget.disabledAnimation
                            ? this.widget.value
                            : 0,
                        end: this.widget.value),
                    duration: Duration(milliseconds: animation),
                    builder: (context, value, child) {
                      return Text(
                        '${this.widget.symbol}${this.widget.isCeil ? value.ceil() : value.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      );
                    })
              ],
            ),
          );
        });
  }
}
