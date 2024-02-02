// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fitness_360/interface/cardio/pedometre.dart';

class CardioScreen extends StatefulWidget {
  const CardioScreen({Key? key}) : super(key: key);

  @override
  _CardioScreenState createState() => _CardioScreenState();
}

class _CardioScreenState extends State<CardioScreen> {
  bool isRunning = false;
  int elapsedTime = 0;
  late Stopwatch _stopwatch;
  int totalTime = 0;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }



  void startStopwatch() {
    setState(() {
      isRunning = true;
      _stopwatch.start();
      // Atualiza o tempo a cada 100 milissegundos
      Future.doWhile(() async {
        await Future.delayed(const Duration(milliseconds: 100));
        if (isRunning) {
          setState(() {
            elapsedTime = _stopwatch.elapsedMilliseconds;
          });
        }
        return isRunning;
      });
    });
  }

  void stopStopwatch() {
    setState(() {
      isRunning = false;
      _stopwatch.stop();
      elapsedTime = _stopwatch.elapsedMilliseconds;
    });
  }

  void resetStopwatch() {
    setState(() {
      isRunning = false;
      _stopwatch.reset();
      elapsedTime = 0;
    });
  }

  void finishCardio() {
    if (isRunning) {
      stopStopwatch();
    }

    setState(() {
      totalTime = elapsedTime;
    });
    // Adicione a lógica adicional para finalizar o cardio, se necessário.
    // Por exemplo, você pode querer salvar o tempo total decorrido.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo: ${Duration(milliseconds: elapsedTime).toString().substring(0, 10)}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: isRunning ? null : startStopwatch,
                    child: const Text('Iniciar'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: isRunning ? stopStopwatch : null,
                    child: const Text('Parar'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: resetStopwatch,
                    child: const Text('Reiniciar'),
                  ),
                ]),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: finishCardio,
                  child: const Text('Finalizar Cardio'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>  const PedometreScreen()));
                  },
                  child: const Text('Ativar Pedômetro'),
                ),
                const SizedBox(height: 20.0),
               
                if (totalTime > 0 && !isRunning)
                  Text(
                    'Cardio Finalizado!\nTempo Total: ${Duration(milliseconds: totalTime).toString().substring(0, 10)}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18.0),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
