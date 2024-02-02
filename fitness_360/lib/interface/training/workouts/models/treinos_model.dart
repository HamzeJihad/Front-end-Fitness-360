import 'package:json_annotation/json_annotation.dart';
import 'package:fitness_360/interface/training/workouts/models/exercises.dart';

part 'treinos_model.g.dart';

@JsonSerializable()
class Treinos {
  factory Treinos.fromJson(Map<String, dynamic> json) => _$TreinosFromJson(json);
  Map<String, dynamic> toJson() => _$TreinosToJson(this);
  Treinos clone() => _$TreinosFromJson(toJson());
  Treinos(
      {this.id,
      this.urlCapa,
      this.nomeTreino,
      this.tipoExecucao,
      this.diasSemana,
      this.numeroExercicios,
      this.exercicios});

  String? id;
  String? urlCapa;
  String? nomeTreino;
  String? tipoExecucao;
  String? diasSemana;
  int? numeroExercicios;
  List<Exercicio>? exercicios;
}
