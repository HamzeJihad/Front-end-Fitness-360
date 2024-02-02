import 'package:flutter/material.dart';

Widget backgroundWidget() {
  return const SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Image(
      image: AssetImage('assets/images/gride.png'),
      color: Colors.black,
      fit: BoxFit.cover,
    ),
  );
}
