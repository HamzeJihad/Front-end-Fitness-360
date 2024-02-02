import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 355,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://uploads.metropoles.com/wp-content/uploads/2022/04/21095707/academia-treino.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
