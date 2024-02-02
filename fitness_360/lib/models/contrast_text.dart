import 'package:flutter/material.dart';

class ContrastText extends StatelessWidget {
  const ContrastText({Key? key, required this.child, this.color}) : super(key: key);
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8,4,8,4),
      decoration: BoxDecoration(
        color: color?? Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
