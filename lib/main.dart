import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_grades/CONSTS.dart';

import 'screens/subject_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((_) {
      runApp(MaterialApp(
        home: SubjectScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', accentColor: CONSTS.purpleColor),
      ));
  });
}
