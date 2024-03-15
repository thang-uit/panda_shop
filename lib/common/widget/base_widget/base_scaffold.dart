import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      this.body,
      // this.backgroundColor,
      this.bottomSheet,
      this.appBar});

  final Widget? body;
  // final Color? backgroundColor;
  final Widget? bottomSheet;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor ?? ConstantColors.primary,
      resizeToAvoidBottomInset: true,
      // should be true for seeing content in login page, when keyboard is up
      appBar: appBar,
      body: GestureDetector(
          onLongPress: () {
            BetterFeedback.of(context).showAndUploadToSentry();
          },
          child: body ?? Container()),
      bottomSheet: bottomSheet,
    );
  }
}
