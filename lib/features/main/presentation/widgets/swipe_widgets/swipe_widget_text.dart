import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeWidgetText extends StatelessWidget {
  const SwipeWidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = 29;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get access to your',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w200),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        Row(
          children: [
            Text(
              'finances ',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              'Anytime,',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        Text(
          'Anywhere.',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Secure your financial future with our trusted banking services',
            style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
