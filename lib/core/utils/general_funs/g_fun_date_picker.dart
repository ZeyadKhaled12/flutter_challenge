import 'package:flutter/material.dart';
import 'package:flutter_challenge/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GFunDatePicker {
  final BuildContext context;

  GFunDatePicker({required this.context});

  Future<DateTime?> getDateTime(
      {DateTime? firstlDate, DateTime? initialDate}) async {
    return await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            dialogBackgroundColor: const Color(0XFFEFEFEF),
            textTheme: TextTheme(
              headlineSmall: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
              titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              labelSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              bodyLarge: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: AppColors.primary),
              titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              titleSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            colorScheme: const ColorScheme.light(
              surface: Colors.white,
              primary: Colors.white,
              onSurface: AppColors.primary,
              onPrimary: AppColors.primary,
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 1 / 3,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: child!,
          ),
        );
      },
      initialDate: initialDate,
      firstDate: firstlDate ?? DateTime.now(),
      lastDate: DateTime(2101),
    ).then((selectedDate) {
      return selectedDate;
    });
  }
}
