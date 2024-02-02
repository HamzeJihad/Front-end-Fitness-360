import 'package:json_annotation/json_annotation.dart';
part 'exercises.g.dart';

@JsonSerializable()
class Exercicio {
  factory Exercicio.fromJson(Map<String, dynamic> json) => _$ExercicioFromJson(json);
  Map<String, dynamic> toJson() => _$ExercicioToJson(this);
  Exercicio clone() => _$ExercicioFromJson(toJson());
  Exercicio(
      {this.id,
      this.urlCapa,
      this.nomeExercicio,
      this.quantidadeSeries,
      this.quantidadeRepeticao,
      this.cargaExercicio,
      this.exercicioConcluido,
      this.quantidadeSeriesConcluidas,
      this.treinoId,
      this.tempoExercicio});

  String? id;
  String? urlCapa;
  String? nomeExercicio;
  String? quantidadeSeries;
  String? quantidadeRepeticao;
  String? cargaExercicio;
  int? tempoExercicio;
  num? quantidadeSeriesConcluidas;
  String ?treinoId;
  bool ? exercicioConcluido;  

}