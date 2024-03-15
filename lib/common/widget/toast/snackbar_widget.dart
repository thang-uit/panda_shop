import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop/utils/constant/colors.dart';
import 'package:panda_shop/utils/constant/enums.dart';
import 'package:panda_shop/utils/constant/font_styles.dart';

class SnackBarUtil {
  static final List<_SnackBarMessage> _messageQueue = <_SnackBarMessage>[];
  static bool _isShowing = false;

  static void show(String message,
      {String title = 'Panda', ToastType type = ToastType.info}) {
    _messageQueue.add(_SnackBarMessage(title, message, type));
    if (!_isShowing) {
      _showNextMessage();
    }
  }

  static Future<void> _showNextMessage() async {
    if (_messageQueue.isNotEmpty) {
      final _SnackBarMessage message = _messageQueue.removeAt(0);
      _isShowing = true;
      await _showMessage(message.title, message.message, message.type);
      _isShowing = false;
      _showNextMessage();
    }
  }

  static Future<void> _showMessage(
      String title, String message, ToastType type) async {
    var color = ConstantColors.info;
    var icon = Icons.info_outline_rounded;

    switch (type) {
      case ToastType.success:
        color = ConstantColors.success;
        icon = Icons.check_circle_outline_rounded;
        break;

      case ToastType.error:
        color = ConstantColors.error;
        icon = Icons.nearby_error_outlined;
        break;

      case ToastType.warning:
        color = ConstantColors.warning;
        icon = Icons.warning_amber_rounded;
        break;

      default:
        color = ConstantColors.info;
        icon = Icons.info_outline_rounded;
        break;
    }

    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: color),
      ),
      icon: Icon(icon, color: color),
      backgroundColor: ConstantColors.grey,
      messageText: Text(message,
          style: bodyMedium?.copyWith(color: ConstantColors.black)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      duration: const Duration(seconds: 5),
    );

    await Future<dynamic>.delayed(const Duration(seconds: 6));
  }
}

class _SnackBarMessage {
  _SnackBarMessage(this.title, this.message, this.type);

  final String title;
  final String message;
  final ToastType type;
}
