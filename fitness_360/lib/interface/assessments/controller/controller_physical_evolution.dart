import 'package:get/get.dart';
import 'package:fitness_360/interface/home/service/home_service.dart';
import 'package:fitness_360/interface/training/workouts/models/pessoa.dart';

class PhysicalController extends GetxController {
  RxString treinoEscolhido = ''.obs;
  RxBool treinoSelecionado = false.obs;

  int? quantidadeDias;
  int? frequenciaSemanal;
  double? ingestaoCaloricaDiaria;

  final homeService = Get.find<HomeService>();

  bool loadingPessoa = false;

  List<Pessoa> pessoas = [];
  Pessoa gemeoDigital = Pessoa();
  popularPessoa() {
    loadingPessoa = true;
    pessoas.clear();
    update();
    homeService.getPessoas().then((value) {
      pessoas.addAll(value);
      loadingPessoa = false;
      update();
    }).catchError((onError) {});
  }

  getGemeosDigitais(double kcalDiaria, int diasTotais, int frequenciaSemanal,{Function? loading, Function? success}) {
    final Map<String, dynamic> body = {
      "id_pessoa": "a4ed71bb-c888-4c33-a07e-b087b3f45406",
      "kcal": kcalDiaria,
      "diasTotais": diasTotais,
      "freqSemanal": frequenciaSemanal
    };
    loading?.call();
    homeService.getGemeoDigital(body).then((value) {
      gemeoDigital = value;
      update();
      success?.call();
    }).catchError((onError) {});
  }
}
