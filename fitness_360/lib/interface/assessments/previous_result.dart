// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/assessments/controller/controller_physical_evolution.dart';
import 'package:fitness_360/interface/home/home_page.dart';

class PreviousResultPage extends StatefulWidget {
  const PreviousResultPage({super.key});

  @override
  State<PreviousResultPage> createState() => _PreviousResultPageState();
}

class _PreviousResultPageState extends State<PreviousResultPage> {
  double imc = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão'),
        centerTitle: true,
        backgroundColor: NeumorphicTheme.baseColor(context),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: GetBuilder<PhysicalController>(builder: (controller) {
        return Center(
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 5,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Dados Previstos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoRow('Peso:', '${controller.gemeoDigital.peso}'),
                  _buildInfoRow('Altura:', '${controller.gemeoDigital.altura}'),
                  _buildInfoRow('Sexo:', '${controller.gemeoDigital.sexo}'),
                  _buildInfoRow('Idade:', '${controller.gemeoDigital.idade}'),
                  _buildInfoRow('IMC:', '${controller.gemeoDigital.imc}'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: NeumorphicFloatingActionButton(
        child: const Icon(Icons.arrow_back, size: 30),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => const HomePage()), (Route<dynamic> route) => false);
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
