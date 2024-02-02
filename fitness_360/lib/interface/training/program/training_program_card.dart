import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/models/circular_progress_dash.dart';

class TrainingProgramCard extends StatefulWidget {
  const TrainingProgramCard({
    Key? key,
  }) : super(key: key);
  @override
  State<TrainingProgramCard> createState() => _TrainingProgramCardState();
}

class _TrainingProgramCardState extends State<TrainingProgramCard> {
  @override
  Widget build(BuildContext context) {
    var percent = 75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Programa de treino',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Card(
          color: const Color.fromRGBO(243, 243, 244, 1),
          margin: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 12, 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: CircularProgressIndicatorRounded(
                              backgroundColor: Colors.blueGrey,
                              strokeWidth: 20,
                              value: 0.76,
                              valueColor: AlwaysStoppedAnimation(context.theme.primaryColor),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  percent.toStringAsFixed(0),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(81, 85, 90, 1),
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '%',
                                  style: TextStyle(
                                    color: Color.fromRGBO(81, 85, 90, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 12),
                      color: const Color.fromRGBO(220, 221, 223, 1),
                      height: 130,
                      width: 1,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 12),
                          width: 163,
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color.fromRGBO(220, 221, 223, 1)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '30',
                                    style: TextStyle(
                                      color: Color.fromRGBO(111, 116, 123, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Container(
                                    color: const Color.fromRGBO(220, 221, 223, 1),
                                    height: 27,
                                    width: 1,
                                  ),
                                  const Text(
                                    '40',
                                    style: TextStyle(
                                      color: Color.fromRGBO(81, 85, 90, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Válido até 30/12/2023',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
