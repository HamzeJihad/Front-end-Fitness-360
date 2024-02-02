import 'package:fitness_360/interface/training/workouts/models/pessoa.dart';
import 'package:fitness_360/interface/training/workouts/models/treinos_model.dart';
import 'package:fitness_360/service/config_url.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET('${ConfigURL.PROJETOSOFTWARE}/pessoas')
  Future<List<Pessoa>> getPessoas();

  
  @POST('${ConfigURL.DIGITALTWIN}/digital-twin')
  Future<Pessoa> getGemeoDigital(@Body() Map<String, dynamic> body);

  @GET('${ConfigURL.PROJETOSOFTWARE}/treino')
  Future<List<Treinos>> getTraining();

  @PUT('${ConfigURL.PROJETOSOFTWARE}/exercicios/{id}')
  Future<dynamic> marcarExercicioConcluido(@Path('id') String? id, @Body() Map<String, dynamic> body);
}
