import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../app/app.dart';
import '../../../../../configs/app_colors.dart';
import '../../../../../core/utils/general_widgets/g_widget_drawer_icon.dart';

class GphWidgetTop extends StatelessWidget {
  const GphWidgetTop(
      {super.key,
      required this.indexOpt,
      required this.onChoose,
      required this.indexAM,
      required this.onChooseAm});
  final int indexOpt;
  final int indexAM;
  final Function(int index) onChoose;
  final Function(int index) onChooseAm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (App.isWeb) const GWidgetDrawerIcon(),
        Text(
          'Charts',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 28)),
        Row(
          children: [
            OptionWidget(
              text: 'Date',
              isChosen: indexOpt == 0,
              onChoose: () {
                onChoose(0);
              },
            ),
            OptionWidget(
              text: 'Time',
              isChosen: indexOpt == 1,
              onChoose: () {
                onChoose(1);
              },
            ),
          ],
        ),
        if (indexOpt == 1)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                OptionWidget(
                  text: 'AM',
                  isChosen: indexAM == 0,
                  onChoose: () {
                    onChooseAm(0);
                  },
                ),
                OptionWidget(
                  text: 'PM',
                  isChosen: indexAM == 1,
                  onChoose: () {
                    onChooseAm(1);
                  },
                ),
              ],
            ),
          ),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  const OptionWidget(
      {super.key,
      required this.isChosen,
      required this.text,
      required this.onChoose});
  final bool isChosen;
  final String text;
  final Function() onChoose;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onChoose,
        child: Container(
          decoration: BoxDecoration(
              color: isChosen
                  ? Colors.white.withOpacity(0.4)
                  : AppColors.graphCard,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
