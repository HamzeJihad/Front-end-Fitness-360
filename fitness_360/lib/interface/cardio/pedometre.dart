// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/home/home_page.dart';
import 'package:fitness_360/interface/training/workouts/controller/controller_workout.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';
import 'package:fitness_360/models/basic_widget_util.dart';
import 'package:fitness_360/models/snackbar_widget.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class PedometreScreen extends StatefulWidget {
  const PedometreScreen({super.key});

  @override
  _PedometreScreenState createState() => _PedometreScreenState();
}

class _PedometreScreenState extends State<PedometreScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';
  bool isFirstReading = true;
  final controller = Get.find<WorkoutController>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  int initialSteps = 0;

  void onStepCount(StepCount event) {
    if (isFirstReading) {
      initialSteps = event.steps;
      isFirstReading = false;
    }
    setState(() {
      _steps = (event.steps - initialSteps).toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<void> initPlatformState() async {
    if (await Permission.activityRecognition.request().isGranted) {
      _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
      _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);

      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: const Text('Contagem de passos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Passos andados',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: const TextStyle(fontSize: 60),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Status atual',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? const TextStyle(fontSize: 30)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  controller.marcarExercicioConcluido(
                      Exercicio(
                        cargaExercicio: '0',
                        exercicioConcluido: true,
                        id: '01c339bb-7c54-456a-937d-8ac4747b581c',
                        urlCapa:
                            "https://www.iol.pt/multimedia/oratvi/multimedia/imagem/id/625ed4f00cf2ea367d37035c/1024.jpg",
                        nomeExercicio: "Caminhar",
                        quantidadeSeries: "1",
                        quantidadeRepeticao: _steps,
                        treinoId: "c4244a39-c813-41b8-9559-66d0bf740786",
                        tempoExercicio: 0,
                        quantidadeSeriesConcluidas: 1,
                      ), loading: () {
                    BasicWidgetUtil().showLoading(context: context);
                  }, success: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
                    SnackbarWidget.success(message: 'Passos salvos com sucesso', context: context);
                  });
                },
                icon: const Icon(Icons.directions_walk_outlined),
                label: const Text('Finalizar caminhada'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Cor do texto do botão
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
