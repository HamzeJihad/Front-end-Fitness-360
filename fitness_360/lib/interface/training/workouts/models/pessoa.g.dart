// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa(
      id: json['id'] as String?,
      altura: json['altura'] as String?,
      peso: json['peso'] as String?,
      idade: json['idade'] as String?,
      sexo: json['sexo'] as String?,
      imc: json['imc'] as String?,
    );

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'id': instance.id,
      'altura': instance.altura,
      'peso': instance.peso,
      'idade': instance.idade,
      'sexo': instance.sexo,
      'imc': instance.imc,
    };
