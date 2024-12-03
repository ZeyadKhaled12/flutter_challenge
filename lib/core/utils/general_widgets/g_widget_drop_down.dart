import 'package:flutter/material.dart';
import 'package:flutter_challenge/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GWidgetDropDown extends StatelessWidget {
  const GWidgetDropDown(
      {super.key,
      required this.items,
      this.dropdownValue,
      required this.onChanged,
      this.backGroundColor,
      this.fontSize,
      this.itemOptionColor,
      this.isError = false,
      this.hintSize,
      this.title,
      this.padding,
      this.height = 35});
  final List<String> items;
  final String? dropdownValue;
  final Function(int index) onChanged;
  final Color? backGroundColor;
  final Color? itemOptionColor;
  final double? fontSize;
  final double? hintSize;
  final String? title;
  final bool isError;
  final EdgeInsetsGeometry? padding;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              title!,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: height,
                padding: padding ?? const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.4), width: 1)),
                child: Center(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    underline: Container(
                      height: 0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: dropdownValue == null ? Colors.grey : Colors.white,
                      size: 25,
                    ),
                    elevation: 10,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.8),
                    dropdownColor: AppColors.secondary,
                    onChanged: (value) {
                      onChanged(items.indexOf(value!));
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
