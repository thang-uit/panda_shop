import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop/bindings/on_boarding_binding.dart';
import 'package:panda_shop/bindings/splash_binding.dart';
import 'package:panda_shop/features/authentication/screens/onboarding.dart';
import 'package:panda_shop/features/splash/screens/splash.dart';

abstract class AppRoutes {
  static const String start = '/';
  static const String onBoarding = '/onboarding';

  // ============================================================

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<SplashScreen>(
      name: start,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      // transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
      // curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<OnBoardingScreen>(
      name: onBoarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
