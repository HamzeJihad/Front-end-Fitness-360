import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    Key? key,
    this.iconSchool = false,
    this.active = false,
    required this.icon,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final bool active;
  final IconData icon;
  final void Function() onTap;
  final String text;
  final bool iconSchool;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: SizedBox(
          height: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: active ? context.theme.primaryColor : context.theme.iconTheme.color,
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        
              ),
            ],
          ),
        ),
      ),
    );
  }
}
