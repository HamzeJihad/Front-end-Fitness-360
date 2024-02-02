import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/training/workouts/controller/controller_workout.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';
import 'package:fitness_360/interface/training/workouts/models/header.dart';
import 'package:fitness_360/interface/training/workouts/start/screen_init_workout.dart';
import 'package:fitness_360/interface/training/workouts/widget/get.all.exercises.dart';
import 'package:fitness_360/models/primary_button.dart';

class TrainingSheetSummary extends StatefulWidget {
  const TrainingSheetSummary({Key? key, required this.exercise}) : super(key: key);

  final List<Exercicio> exercise;
  @override
  State<TrainingSheetSummary> createState() => _TrainingSheetSummaryState();
}

class _TrainingSheetSummaryState extends State<TrainingSheetSummary> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkoutController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            const Header(),
            SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 300),
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      controller.treinosAluno[0].nomeTreino ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Text('observação do treino',
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(height: 24),
                    ...getAllExercises(widget.exercise)

                    //add personal exercise
                    //    infoPersonal(training),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_left,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )),
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.help_outline_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ScreenInitWorkout(
                                    listaDeExercicios: widget.exercise,
                                  )));
                    },
                    value: 'Começar Treino',
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
              ),
            ),
          ]),
        ),
      ));
    });
  }
}
