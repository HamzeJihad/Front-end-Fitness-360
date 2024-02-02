import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.value,
    this.onPressed,
    this.fullWidth = true,
    this.colorButton,
    this.icon,
    this.colorText,
    this.loadingButton = false,
    this.titleButton,
    this.enabled = true,
    this.shape,
    this.width,
    this.iconRight,
    this.heightButton = 48,
    this.onSurface,
    this.fontWeight,
    this.textStyle,
  }) : super(key: key);
  final String value;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final bool fullWidth;
  final double? width;
  final Color? colorButton;
  final Widget? icon;
  final Widget? iconRight;
  final Color? colorText;
  final Color? onSurface;
  final Function()? onPressed;
  final OutlinedBorder? shape;
  final Color? titleButton;
  final bool loadingButton;
  final bool enabled;
  final double heightButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      child: ElevatedButton(
        onPressed: enabled && !loadingButton ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shadowColor: colorButton ?? Colors.blueGrey,
         
          minimumSize: Size.zero,
          backgroundColor: colorButton ?? context.theme.primaryColor, // Set this
          padding: EdgeInsets.zero,
          maximumSize: fullWidth == true ? Size(fullWidth ? Get.size.width : width ?? 50, 48) : null,
          disabledBackgroundColor: context.theme.disabledColor,
          elevation: 10,
          // ignore: deprecated_member_use
          primary: colorButton ?? context.theme.primaryColor,
          shape: shape ??
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: loadingButton
              ? fullWidth
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(
                          left: value.length.toDouble() * 2, right: value.length.toDouble() * 2),
                      child: const CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (icon != null) icon!,
                    Text(
                      value.tr,
                   
                      style: textStyle,
                    ),
                    if (iconRight != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: iconRight!,
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}


