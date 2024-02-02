// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';
import 'package:fitness_360/models/util_color.dart';

class TrainingItem extends StatefulWidget {
  const TrainingItem({
    Key? key,
    required this.training,
  }) : super(key: key);
  final Exercicio training;
  @override
  State<TrainingItem> createState() => _TrainingItemState();
}

class _TrainingItemState extends State<TrainingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  Image(
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                      image: NetworkImage(
                        widget.training.urlCapa!,
                      )),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        onPressed: () async {
                        },
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.training.nomeExercicio ?? '',
                        style: const TextStyle(
                          color: Color(0xFF878A92),
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                        width: double.maxFinite,
                        height: 30,
                        child: ListView(scrollDirection: Axis.horizontal, children: [
                          cardDetailsheet(
                            context,
                            '${widget.training.quantidadeSeries} séries',
                          ),
                          cardDetailsheet(
                            context,
                            '${widget.training.quantidadeRepeticao} repetição',
                          ),
                          Visibility(
                            visible: widget.training.tempoExercicio != null,
                            child: cardDetailsheet(
                              context,
                              '${widget.training.tempoExercicio} s',
                            ),
                          )
                        ]))
                  ]),
            )
          ],
        ),
        Divider(
          thickness: 2,
          color: HexColor.fromHex('#F3F3F4'),
        ),
      ],
    );
  }

  static Widget cardDetailsheet(BuildContext context, String title) {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.brightness == Brightness.light
                ? const Color(0xfffafafa)
                : const Color(0XFF383B3E),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: context.theme.brightness == Brightness.light
                  ? const Color(0XFFC7C9CC)
                  : const Color(0XFF51555A),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 12, color: Color(0XFF878A92)),
          ),
        ));
  }
}
