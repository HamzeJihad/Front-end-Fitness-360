import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class BasicWidgetUtil {
  void showLoading({Color? barrierColor, Color? loadingColor,  required BuildContext context}) {
    showDialog(
      barrierColor: barrierColor ?? Colors.black54,
      context: Get.context ??  context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return PopScope(
          canPop: false,
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: LoadingBouncingGrid.circle(
                borderColor: loadingColor ?? Theme.of(context).primaryColor,
                borderSize: 2,
                backgroundColor: loadingColor ?? Theme.of(context).primaryColor,
                duration: const Duration(milliseconds: 1500),
              ),
            ),
          ),
        );
      },
    );
  }
}
