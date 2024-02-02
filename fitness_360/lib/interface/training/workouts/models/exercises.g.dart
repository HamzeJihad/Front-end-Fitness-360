// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercises.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercicio _$ExercicioFromJson(Map<String, dynamic> json) => Exercicio(
      id: json['id'] as String?,
      urlCapa: json['urlCapa'] as String?,
      nomeExercicio: json['nomeExercicio'] as String?,
      quantidadeSeries: json['quantidadeSeries'] as String?,
      quantidadeRepeticao: json['quantidadeRepeticao'] as String?,
      cargaExercicio: json['cargaExercicio'] as String?,
      exercicioConcluido: json['exercicioConcluido'] as bool?,
      quantidadeSeriesConcluidas: json['quantidadeSeriesConcluidas'] as num?,
      treinoId: json['treinoId'] as String?,
      tempoExercicio: json['tempoExercicio'] as int?,
    );

Map<String, dynamic> _$ExercicioToJson(Exercicio instance) => <String, dynamic>{
      'id': instance.id,
      'urlCapa': instance.urlCapa,
      'nomeExercicio': instance.nomeExercicio,
      'quantidadeSeries': instance.quantidadeSeries,
      'quantidadeRepeticao': instance.quantidadeRepeticao,
      'cargaExercicio': instance.cargaExercicio,
      'tempoExercicio': instance.tempoExercicio,
      'quantidadeSeriesConcluidas': instance.quantidadeSeriesConcluidas,
      'treinoId': instance.treinoId,
      'exercicioConcluido': instance.exercicioConcluido,
    };
