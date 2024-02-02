import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitness_360/models/contrast_text.dart';

class TrainingSeAllProgram extends StatefulWidget {
  const TrainingSeAllProgram({
    Key? key,
    this.userImage,
    this.backgroundImage,
    this.trainingName,
    this.numberTraining,
    this.trainingSeq,
    this.dayWeek,
    this.typeExecution,
  }) : super(key: key);
  final String? userImage;
  final String? backgroundImage;
  final String? trainingName;
  final int? numberTraining;
  final String? trainingSeq;
  final String? dayWeek;
  final String? typeExecution;

  @override
  State<TrainingSeAllProgram> createState() => _TrainingSeAllProgramState();
}

class _TrainingSeAllProgramState extends State<TrainingSeAllProgram> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.sizeOf(context).width - 64,
      height: 201,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image:
            widget.backgroundImage == null || widget.backgroundImage!.isEmpty || widget.backgroundImage == ''
                ? const DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: NetworkImage(
                      widget.backgroundImage!,
                    ),
                    fit: BoxFit.cover,
                  ),
        color: context.theme.colorScheme.primary.withOpacity(.7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              runSpacing: 0,
              spacing: 0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Visibility(
                  visible: widget.userImage != null && widget.userImage != '',
                  replacement: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/empty/emptyLib/light/personal_logo_red_light.png'),
                  ),
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: context.theme.colorScheme.primary,
                      backgroundImage: NetworkImage(
                        widget.userImage!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ContrastText(
                  child: Text(
                    widget.trainingName ?? '',style:const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContrastText(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.sports_gymnastics,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.numberTraining ?? 0} ${'exercises'.tr}',
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.typeExecution != null && widget.typeExecution!.isNotEmpty)
                  const SizedBox(height: 8),
                if (widget.typeExecution != null && widget.typeExecution!.isNotEmpty)
                  ContrastText(
                    child: Text(
                      widget.typeExecution!,
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const SizedBox(height: 8),
                if (widget.dayWeek != null && widget.dayWeek!.isNotEmpty)
                  ContrastText(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.dayWeek ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
