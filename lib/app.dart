import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop/common/routes/app_routes.dart';
import 'package:panda_shop/utils/logging/logger.dart';
import 'package:panda_shop/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        // home: const SplashScreen(),
        getPages: AppRoutes.routes,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        defaultTransition: Transition.native,
        enableLog: true,
        logWriterCallback: (String msg, {bool isError = false}) {
          LoggerMan.e("GetX: $msg | ${isError ? "isError: true" : ""}");
        },
      ),
    );
  }
}
