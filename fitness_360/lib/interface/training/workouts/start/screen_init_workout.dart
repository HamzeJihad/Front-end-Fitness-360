import 'package:fitness_360/interface/training/workouts/view_details_training_executed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/training/workouts/controller/controller_workout.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';

class ScreenInitWorkout extends StatefulWidget {
  const ScreenInitWorkout({super.key, required this.listaDeExercicios});

  final List<Exercicio> listaDeExercicios;
  @override
  State<ScreenInitWorkout> createState() => _ScreenInitWorkoutState();
}

class _ScreenInitWorkoutState extends State<ScreenInitWorkout> {
  final controller = Get.find<WorkoutController>();
  void concluirSerie(Exercicio exercicio) {
    setState(() {
      if (exercicio.quantidadeSeriesConcluidas == null) {
        exercicio.quantidadeSeriesConcluidas = 1;
      } else if (exercicio.quantidadeSeriesConcluidas! < int.parse(exercicio.quantidadeSeries ?? '0')) {
        exercicio.quantidadeSeriesConcluidas = exercicio.quantidadeSeriesConcluidas! + 1;
      }

      exercicio.exercicioConcluido =
          exercicio.quantidadeSeriesConcluidas == int.parse(exercicio.quantidadeSeries ?? '0');
    });

    controller.marcarExercicioConcluido(exercicio);
  }

  bool todasAsSeriesConcluidas() {
    return widget.listaDeExercicios.every((exercicio) => exercicio.exercicioConcluido == true);
  }

  void verificarExercicioTemSerieConcluida() {
    for (Exercicio exercisoUnico in widget.listaDeExercicios) {
      exercisoUnico.exercicioConcluido =
          exercisoUnico.quantidadeSeriesConcluidas == int.parse(exercisoUnico.quantidadeSeries ?? '0');
    }
  }

  @override
  Widget build(BuildContext context) {
    verificarExercicioTemSerieConcluida();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treino'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.listaDeExercicios.length,
        itemBuilder: (context, index) {
          Exercicio exercicio = widget.listaDeExercicios[index];
          return Card(
            elevation: 5.0,
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        exercicio.urlCapa ?? "",
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      exercicio.nomeExercicio ?? "",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                        "Séries Concluídas: ${exercicio.quantidadeSeriesConcluidas ?? 0}/${exercicio.quantidadeSeries ?? 0}"),
                    Text("Repetições: ${exercicio.quantidadeRepeticao ?? 0}"),
                    Text("Carga: ${exercicio.cargaExercicio ?? ""}"),
                    Text("Concluído: ${exercicio.exercicioConcluido ?? false}"),
                    Text("Tempo: ${exercicio.tempoExercicio ?? 0} segundos"),
                    const SizedBox(height: 12.0),
                    exercicio.exercicioConcluido == true
                        ? const Text(
                            'Exercício Concluído',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              concluirSerie(exercicio);
                            },
                            child: const Text('Concluir Série'),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: todasAsSeriesConcluidas()
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ViewDetailsTrainingExecuted(
                              caloriasGastas: '100',
                              nomeTreino: 'treino 1',
                              metaTreinos: 40,
                              pesoLevantado: '450',
                              seriesConcluidas: '10',
                              treinosConcluidos: 31,
                              tempoTreino: '00:06:23',
                            )));
              },
              child: const Icon(Icons.check),
            )
          : null,
    );
  }
}
