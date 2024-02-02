import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/models/util_color.dart';

class SnackbarWidget {
  static success({required String message, IconData? icon = Icons.check, required BuildContext context}) {
    Flushbar(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(top: 16),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      maxWidth: kIsWeb ? Get.width / 2.6 : Get.width - 32,
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Row(
        children: [
          Container(
            height: 53,
            width: 57,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              color:  HexColor.fromHex('#43474B') ,
            ),
            child: Icon(icon, color: HexColor.fromHex('#05E105'), size: 20),
          ),
          Container(
            width: 1,
            height: message.length >= 63 ? 80 : 53,
            color: HexColor.fromHex('#5F6369'),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Text(message.tr, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          )),
        ]
      ),
      backgroundColor: Colors.blueGrey,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      duration: const Duration(seconds: 3),
    ).show(context);
  }


}
