import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SgAppTheme.lightTheme,
      darkTheme: SgAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      /* show loader or circular progress indicator meanwhile Authentication Repository is deciding to show relevant screen */ home:
          const Scaffold(
        backgroundColor: SgColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
