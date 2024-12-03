import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../core/utils/general_widgets/g_widget_snackbar.dart';

class App {
  static const double paddingLR = 25;
  static const double bottomHeight = 60;
  static const bool isWeb = kIsWeb;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static Future snackBar(
          {required String body, required bool isSucess}) async =>
      await GWidgetSnackBar(
              body: body,
              isSucess: isSucess,
              context: navigatorKey.currentState!.context)
          .showSnackBar();
}
