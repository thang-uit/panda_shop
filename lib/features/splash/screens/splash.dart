import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:panda_shop/common/assets/lotties.dart';
import 'package:panda_shop/common/widget/screen/splash_screen.dart';
import 'package:panda_shop/features/authentication/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: splashScreen(),
      // splash: "assets/logos/logo_trans_only_panda_500.png",
      nextScreen: const OnBoardingScreen(),
      splashTransition: SplashTransition.scaleTransition,
      // pageTransitionType: PageTransitionType.bottomToTop,
      splashIconSize: 300,
    );
  }

  Widget splashScreen() {
    return Lottie.asset(
      AssetLotties.lottiePandaLaptop,
      fit: BoxFit.fitWidth,
      animate: true,
    );
  }
}
