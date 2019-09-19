import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:scoped_model/scoped_model.dart';
import 'package:diabetes_memo/data/app_state.dart';
import 'package:diabetes_memo/screen/home.dart';
import 'package:diabetes_memo/styles.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScopedModel<AppState>(
      model: AppState(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        color: Styles.appBackground,
        home: Home(),
      ),
    ),
  );
}
