import 'package:flutter/material.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';
import 'package:fitness_360/interface/training/workouts/widget/training.Item.dart';

List<Widget> getAllExercises(List<Exercicio> training) {
  return [
    //add Exercises
    for (var exercise in training)
      groupExercise(type: 'musculação', children: [
        TrainingItem(
          training: exercise,
        ),
      ])
  ];
}

Widget groupExercise({required String type, required List<Widget> children}) {
  return Container(
    width: double.maxFinite,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blueGrey,
        width: 4,
      ),
    ),
    child: Stack(
      children: [
        Column(
          children: children,
        ),
        Positioned(
          top: -4,
          right: 0,
          child: Container(
        color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.sync,
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
