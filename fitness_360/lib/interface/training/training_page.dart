// ignore_for_file: must_be_immutable

import 'package:fitness_360/interface/training/workouts/start/screen_init_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/training/program/training_program_card.dart';
import 'package:fitness_360/interface/training/workouts/controller/controller_workout.dart';
import 'package:fitness_360/interface/training/workouts/training_se_all_program.dart';
import 'package:fitness_360/interface/training/workouts/training_sheet_summary.dart';
import 'package:fitness_360/models/util_data_base.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final controller = Get.find<WorkoutController>();

  @override
  void initState() {
    super.initState();
    if(controller.treinosAluno.isEmpty){
    controller.popularTreinos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meus treinos',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GetBuilder<WorkoutController>(builder: (controller) {
        return controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 201,
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Padding(padding: EdgeInsets.only(right: 16));
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.treinosAluno.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => TrainingSheetSummary(
                                                exercise: controller.treinosAluno[index].exercicios!)));
                                  },
                                  child: TrainingSeAllProgram(
                                    userImage:
                                        'https://w7.pngwing.com/pngs/1008/377/png-transparent-computer-icons-avatar-user-profile-avatar-heroes-black-hair-computer.png',
                                    backgroundImage: controller.treinosAluno[index].urlCapa,
                                    trainingName: controller.treinosAluno[index].nomeTreino,
                                    numberTraining: controller.treinosAluno[index].numeroExercicios,
                                    dayWeek: controller.treinosAluno[index].diasSemana,
                                    typeExecution: controller.treinosAluno[index].tipoExecucao,
                                  ),
                                );
                              })),
                        ),
                        Visibility(
                            visible: controller.mostrarRetornarExecucao,
                            child: ReturnButton(
                              controller: controller,
                            )),
                        const TrainingProgramCard(),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}

class ReturnButton extends StatelessWidget with UtilDataBase {
  ReturnButton({super.key, required this.controller});
  final WorkoutController controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      ScreenInitWorkout(listaDeExercicios: controller.treinosAluno[0].exercicios!)));
        });
      },
      icon: const Icon(Icons.arrow_circle_right_outlined),
      label: const Text('Retornar a execução'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Cor do texto do botão
      ),
    );
  }
}
