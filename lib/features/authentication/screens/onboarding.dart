import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop/common/assets/images.dart';
import 'package:panda_shop/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop/features/authentication/controllers/onboarding_controller.dart';
import 'package:panda_shop/features/authentication/screens/widget/onboarding_page.dart';
import 'package:panda_shop/utils/constant/colors.dart';
import 'package:panda_shop/utils/constant/sizes.dart';
import 'package:panda_shop/utils/constant/texts.dart';
import 'package:panda_shop/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return BaseScaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: ConstantImages.appLogoTransCircle750,
                title: ConstantTexts.onBoadingTitle1,
                subTitle: ConstantTexts.onBoadingSubTitle1,
              ),
              OnBoardingPage(
                image: ConstantImages.appLogoTransCircle750,
                title: ConstantTexts.onBoadingTitle2,
                subTitle: ConstantTexts.onBoadingSubTitle2,
              ),
              OnBoardingPage(
                image: ConstantImages.appLogoTransCircle750,
                title: ConstantTexts.onBoadingTitle3,
                subTitle: ConstantTexts.onBoadingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDot(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends BaseStatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Positioned(
      right: ConstantSizes.defaultSpace,
      bottom: DeviceUtils.getAppBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: ConstantColors.primary),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: ConstantColors.black,
          )),
    );
  }
}

class OnBoardingDot extends BaseStatelessWidget {
  const OnBoardingDot({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    final controller = OnBoardingController.instance;

    return Positioned(
        bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
        left: ConstantSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          onDotClicked: controller.dotNavigationClick,
          effect:
              JumpingDotEffect(activeDotColor: colorThemeMode, dotHeight: 6),
        ));
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: ConstantSizes.spaceBtwItems,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
