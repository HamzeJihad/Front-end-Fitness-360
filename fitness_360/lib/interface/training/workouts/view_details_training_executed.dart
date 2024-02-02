import 'package:dotted_line/dotted_line.dart';
import 'package:fitness_360/interface/home/home_page.dart';
import 'package:fitness_360/models/background_widget.dart';
import 'package:fitness_360/models/card_info.dart';
import 'package:fitness_360/models/circular_progress_dash.dart';
import 'package:fitness_360/models/util_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ViewDetailsTrainingExecuted extends StatefulWidget {
  const ViewDetailsTrainingExecuted({
    Key? key,
    this.pesoLevantado,
    this.caloriasGastas,
    this.seriesConcluidas,
    this.metaTreinos,
    this.treinosConcluidos,
    this.tempoTreino,
    this.nomeTreino,
    this.dataTreino,
  }) : super(key: key);

  final String? pesoLevantado;
  final String? caloriasGastas;
  final String? seriesConcluidas;
  final num? metaTreinos;
  final num? treinosConcluidos;
  final String? tempoTreino;
  final String? dataTreino;
  final String? nomeTreino;

  @override
  State<ViewDetailsTrainingExecuted> createState() => _ViewDetailsTrainingExecutedState();
}

class _ViewDetailsTrainingExecutedState extends State<ViewDetailsTrainingExecuted> {
  int totalTraining = 0;

  final controllerScreenShot = ScreenshotController();
  var background = const Color(0xff12203c);
  var color1 = const Color(0x00020B1C);
  bool itDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NeumorphicFloatingActionButton(
        child: const Icon(Icons.arrow_back, size: 30),
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          });
        },
      ),
      body: Container(
        color: Colors.blueGrey,
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                  ),
                  //grandient
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.blueGrey,
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                      ),
                    ),
                  ),
                  backgroundWidget(),
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: header(),
                              ),
                              const SizedBox(height: 20),
                              const DottedLine(dashColor: Colors.blueGrey),
                              const SizedBox(height: 20),
                              chart(),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: CardInfo(
                                  type: 'kcal',
                                  value: widget.caloriasGastas?.replaceAll('kcal', '') ?? '',
                                  color: context.theme.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: CardInfo(
                                  type: 'kg',
                                  value: widget.pesoLevantado?.replaceAll('kg', '') ?? '',
                                  color: context.theme.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CardInfo(
                                        type: 'serie',
                                        value: widget.seriesConcluidas ?? '',
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: CardInfo(
                                        type: 'training',
                                        value: widget.treinosConcluidos.toString(),
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chart() {
    double percent = 0.0;
    if ((widget.treinosConcluidos ?? 0) > (widget.metaTreinos ?? 0)) {
      percent = 1.0;
    } else {
      percent = (widget.treinosConcluidos!) / (widget.metaTreinos == 0 ? 1 : widget.metaTreinos!);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: SizedBox(
              height: 110,
              width: 110,
              child: Stack(
                children: [
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: CircularProgressIndicatorRounded(
                      backgroundColor: Colors.blueGrey,
                      strokeWidth: 15,
                      value: percent,
                      valueColor: AlwaysStoppedAnimation(context.theme.primaryColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  (percent * 100).toStringAsFixed(0),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'finishes'.tr,
                                  style: const TextStyle(
                                    color: Color(0xFFDCDDDF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 42),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Da sua meta concluída!',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                ),
                Text(
                  '${widget.treinosConcluidos ?? 0}/${widget.metaTreinos ?? 0}',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget cardInfo({required String type, required String value}) {
    var icons = {
      'kcal': 'assets/images/fire.png',
      'kg': 'assets/images/leading_icon.png',
      'serie': 'assets/images/refresh.png',
      'training': null,
    };
    var labels = {
      'kcal': 'Calorias gastas',
      'kg': 'Peso total levantado',
      'serie': 'Séries',
      'training': 'Treinos',
    };
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      height: type == 'serie' || type == 'training' ? 153 : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 21,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icons[type] != null)
                  Image(
                    image: AssetImage(
                      icons[type]!,
                    ),
                    color: context.theme.primaryColor,
                  ),
                if (icons[type] != null) const SizedBox(width: 5),
                Expanded(
                  child: Text(labels[type]!,
                      style: const TextStyle(
                        color: Color(0xFFC9CBCF),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 6),
            if (type == 'serie' || type == 'training')
              Center(
                  child: Text(
                '$value ${type == 'serie' || type == 'training' ? '' : type}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ))
            else
              Text(
                '$value ${type == 'serie' || type == 'training' ? '' : type}',
                style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: HexColor.fromHex('#51555A')),
              ),
            if (type == 'training')
              Center(
                child: Text(
                  'Em 30 dias',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16, color: HexColor.fromHex('#51555A')),
                ),
              )
          ],
        ),
      ),
    );
  }

  Row timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.tempoTreino!.substring(0, 2),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
        ),
        const Text(
          ':',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
        ),
        Text(
          widget.tempoTreino!.substring(3, 5),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
        ),
        Text(
          ':',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: HexColor.fromHex('#51555A')),
        ),
        Text(
          widget.tempoTreino!.substring(6, 8),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
        ),
        const Expanded(child: SizedBox()),
        Text(
          widget.dataTreino ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        )
      ],
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64, left: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.nomeTreino ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: timer(),
        ),
      ],
    );
  }
}
