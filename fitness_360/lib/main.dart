import 'package:flutter/material.dart';
import 'package:fitness_360/interface/home/home_page.dart';
import 'package:fitness_360/service/init_service.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  await initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
