import 'package:get/get.dart';
import 'package:fitness_360/interface/home/service/home_service.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';
import 'package:fitness_360/interface/training/workouts/models/pessoa.dart';
import 'package:fitness_360/interface/training/workouts/models/treinos_model.dart';
import 'package:fitness_360/models/util_data_base.dart';

class WorkoutController extends GetxController  with UtilDataBase{
  final homeService = Get.find<HomeService>();


  bool loading = false;
  bool loadingConcluded = false;
  bool loadingPessoa = false;
  List<Treinos> treinosAluno = [];
  List<Pessoa>  pessoas = [];
  bool mostrarRetornarExecucao = false;

  buscarExecucaoAndamento(){
    buscarNoBancoBoolean('retornarExecucao').then((value)  {
      if(value== null || value == true){
        mostrarRetornarExecucao = true;
        update();
      }
    });
  }
  popularTreinos() {
    buscarExecucaoAndamento();
    loading = true;
    treinosAluno.clear();
    update();
    homeService.getTraining().then((value) {
      treinosAluno.addAll(value);
      loading = false;
      update();
    }).catchError((onError) {});
  }

  marcarExercicioConcluido(Exercicio exercicio, {Function ? success, Function? loading}) {
    loading?.call();
    loadingConcluded = true;
    update();
    homeService.marcarExercicioConcluido(exercicio.id, exercicio.toJson()).then((value) {
      update();
      success?.call();
    }).catchError((onError) {
      print(onError);
    });

    // treinosAluno.add(Treinos(
    //     diasSemana: ' ',
    //     nomeTreino: 'Treino 1',
    //     numeroExercicios: 5,
    //     tipoExecucao: 'alternada',
    //     urlCapa: 'https://uploads.metropoles.com/wp-content/uploads/2022/04/21095707/academia-treino.jpg'));

    // treinosAluno.add(Treinos(
    //     diasSemana: 'quar ,quint',
    //     nomeTreino: 'Treino 2',
    //     numeroExercicios: 4,
    //     tipoExecucao: 'dias',
    //     urlCapa:
    //         'https://runnersworld.com.br/wp-content/uploads/sites/4/2019/07/sintomas-da-ansiedade-e-depressao.jpg'));

    // treinosAluno.add(Treinos(
    //     diasSemana: 'sexta, sab',
    //     nomeTreino: 'Treino 3',
    //     numeroExercicios: 6,
    //     tipoExecucao: 'alternada',
    //     urlCapa:
    //         'https://blog.gsuplementos.com.br/wp-content/uploads/2019/05/289511-5-dicas-para-ter-mais-foco-no-treino-e-ampliar-seus-resultados.jpg'));

    // popularExercicios();
  }

  popularExercicios() {
    treinosAluno[0].exercicios = [];
    treinosAluno[0].exercicios!.clear();
    treinosAluno[0].exercicios!.add(Exercicio(
        cargaExercicio: '50kg',
        nomeExercicio: 'Supino',
        quantidadeRepeticao: '15',
        quantidadeSeries: '3',
        tempoExercicio: 60,
        urlCapa: 'https://www.dicasdetreino.com.br/wp-content/uploads/2017/05/Tipos-de-Supino.jpg'));

    treinosAluno[0].exercicios!.add(Exercicio(
        cargaExercicio: '20kg',
        nomeExercicio: 'elevação lateral',
        quantidadeRepeticao: '15',
        quantidadeSeries: '3',
        tempoExercicio: 42,
        urlCapa: 'https://static.tuasaude.com/media/article/ne/lc/elevacao-lateral_63271_l.jpg'));

    treinosAluno[0].exercicios!.add(Exercicio(
        cargaExercicio: '120kg',
        nomeExercicio: 'Leg press',
        quantidadeRepeticao: '15',
        quantidadeSeries: '3',
        tempoExercicio: null,
        urlCapa:
            'https://cdn.fisiculturismo.com.br/monthly_2017_03/panturrilha-no-leg-press-45-inicial.jpg.21cb1c35284593214f38729f0406e1a8.jpg'));
  }

  
}
