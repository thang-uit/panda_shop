import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:panda_shop/common/assets/lotties.dart';
import 'package:panda_shop/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop/features/authentication/controllers/onboarding_controller.dart';
import 'package:panda_shop/utils/constant/colors.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          backgroundColor: ConstantColors.primary,
          elevation: 4,
          leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: ConstantColors.dark,
              )),
          title: const Text("Thắng Béo nè"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                onPressed: () => SnackBarUtil.show("Thắng Béo Nè"),
                icon: const Icon(
                  Icons.apps_rounded,
                  color: ConstantColors.dark,
                )),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[hehe()],
          ),
        ));
  }

  Widget hehe() {
    return Lottie.asset(
      AssetLotties.lottiePandaSleep,
      fit: BoxFit.fitWidth,
      animate: true,
    );
  }
}
