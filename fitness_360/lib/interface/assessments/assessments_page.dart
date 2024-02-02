// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:fitness_360/interface/assessments/controller/controller_physical_evolution.dart';
import 'package:fitness_360/interface/assessments/previous_result.dart';
import 'package:fitness_360/models/basic_widget_util.dart';

class AssessmentsPage extends StatefulWidget {
  const AssessmentsPage({super.key});

  @override
  State<AssessmentsPage> createState() => _AssessmentsPageState();
}

class _AssessmentsPageState extends State<AssessmentsPage> {
  @override
  void initState() {
    super.initState();
    Get.find<PhysicalController>().popularPessoa();
  }

  double imc = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evolução Física'),
        centerTitle: true,
        backgroundColor: NeumorphicTheme.baseColor(context),
      ),
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: GetBuilder<PhysicalController>(builder: (controller) {
        if (controller.loadingPessoa == false) {
          imc = (double.parse(controller.pessoas[0].peso!.replaceAll('kg', '')) /
                  (double.parse(controller.pessoas[0].altura!.replaceAll('cm', '')) *
                      double.parse(controller.pessoas[0].altura!.replaceAll('cm', '')))) *
              10000;
        }
        return controller.loadingPessoa
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: 5,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Dados Atuais',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildInfoRow('Peso:', '${controller.pessoas[0].peso}'),
                        _buildInfoRow('Altura:', '${controller.pessoas[0].altura}'),
                        _buildInfoRow('Sexo:', '${controller.pessoas[0].sexo}'),
                        _buildInfoRow('Idade:', '${controller.pessoas[0].idade}'),
                        _buildInfoRow('IMC:', '${imc.toStringAsFixed(2)}'),
                        const SizedBox(height: 20),
                        NeumorphicButton(
                          onPressed: () {
                            _mostrarDialogoTreinos(context, controller);
                          },
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            'Prever Evolução e Programa de Treino',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
      floatingActionButton: NeumorphicFloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: () {},
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _mostrarDialogoTreinos(BuildContext context, PhysicalController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escolha um Programa de Treino'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTreinoOption('Programa A', controller),
              _buildTreinoOption('Programa B', controller),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _mostrarDialogoInformacoesAdicionais(context, controller);
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTreinoOption(String treino, PhysicalController controller) {
    return Obx(
      () => ListTile(
        title: Text(treino),
        tileColor: treino == controller.treinoEscolhido.value ? Colors.blue : null,
        onTap: () {
          setState(() {
            controller.treinoEscolhido.value = treino;
            controller.update();
          });
        },
      ),
    );
  }

  _mostrarDialogoInformacoesAdicionais(BuildContext context, PhysicalController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InformacoesAdicionaisDialog(
          onChanged: (int? dias, int? frequencia, double? ingestao) {
            setState(() {
              controller.quantidadeDias = dias;
              controller.frequenciaSemanal = frequencia;
              controller.ingestaoCaloricaDiaria = ingestao;
            });
          },
        );
      },
    );
  }
}

class InformacoesAdicionaisDialog extends StatefulWidget {
  final Function(int?, int?, double?)? onChanged;

  const InformacoesAdicionaisDialog({Key? key, required this.onChanged}) : super(key: key);

  @override
  _InformacoesAdicionaisDialogState createState() => _InformacoesAdicionaisDialogState();
}

class _InformacoesAdicionaisDialogState extends State<InformacoesAdicionaisDialog> {
  int? _quantidadeDias;
  int? _frequenciaSemanal;
  double? _ingestaoCaloricaDiaria;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Informações Adicionais'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField('Quantidade de Dias:', 'dias', (value) {
            _quantidadeDias = int.tryParse(value);
          }),
          _buildTextField('Frequência Semanal:', 'vezes por semana', (value) {
            _frequenciaSemanal = int.tryParse(value);
          }),
          _buildTextField('Ingestão Calórica Diária:', 'calorias', (value) {
            _ingestaoCaloricaDiaria = double.tryParse(value);
          }),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onChanged!(_quantidadeDias, _frequenciaSemanal, _ingestaoCaloricaDiaria);


            Get.find<PhysicalController>().getGemeosDigitais(
                _ingestaoCaloricaDiaria!, _quantidadeDias!, _frequenciaSemanal!, loading: () {
              BasicWidgetUtil().showLoading(context: context);
            }, success: () {
                   Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PreviousResultPage()));
            });
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String placeholder, void Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        decoration: InputDecoration(labelText: label, hintText: placeholder),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}
