import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class CardInfo extends StatelessWidget {
  CardInfo({Key? key, required this.type, required this.value, this.color}) : super(key: key);
  final String type;
  final String value;
  final Color? color;
  final Map<String, String?> icons = {
    'kcal': 'assets/images/fire.png',
    'kg': 'assets/images/leading_icon.png',
    'serie': 'assets/images/refresh.png',
    'training': null,
  };
  final Map<String, String> labels = {
    'kcal': 'Calorias gastas',
    'kg': 'Peso total levantado',
    'serie': 'Séries concluídas',
    'training': 'Treinos concluídos',
  };
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: type == 'serie' || type == 'training' ? 153 : 134,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icons[type] != null)
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          icons[type]!,
                        ),
                        color: color,
                      ),
                    if (icons[type] != null) const SizedBox(width: 5),
                    Expanded(
                      child: labels[type]! == 'Calorias gastas' || labels[type]! == 'Peso total levantado'
                          ? Text(
                              labels[type]!,
                              style: const TextStyle(
                                color: Color(0xFFDCDDDF),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              labels[type]!,
                              style: const TextStyle(
                                color: Color(0xFFDCDDDF),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                if (type == 'serie' || type == 'training')
                  Center(
                    child: Text(
                      '$value ${type == 'serie' || type == 'training' ? '' : type}'.substring(0, 2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Text(
                    '$value ${type == 'serie' || type == 'training' ? '' : type}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (type == 'training')
                  const Center(
                    child: Text(
                      'Em 30 dias',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
