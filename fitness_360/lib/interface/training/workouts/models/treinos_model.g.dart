// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treinos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Treinos _$TreinosFromJson(Map<String, dynamic> json) => Treinos(
      id: json['id'] as String?,
      urlCapa: json['urlCapa'] as String?,
      nomeTreino: json['nomeTreino'] as String?,
      tipoExecucao: json['tipoExecucao'] as String?,
      diasSemana: json['diasSemana'] as String?,
      numeroExercicios: json['numeroExercicios'] as int?,
      exercicios: (json['exercicios'] as List<dynamic>?)
          ?.map((e) => Exercicio.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreinosToJson(Treinos instance) => <String, dynamic>{
      'id': instance.id,
      'urlCapa': instance.urlCapa,
      'nomeTreino': instance.nomeTreino,
      'tipoExecucao': instance.tipoExecucao,
      'diasSemana': instance.diasSemana,
      'numeroExercicios': instance.numeroExercicios,
      'exercicios': instance.exercicios,
    };
