import 'package:json_annotation/json_annotation.dart';
part 'pessoa.g.dart';

@JsonSerializable()
class Pessoa {
  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaToJson(this);
  Pessoa clone() => _$PessoaFromJson(this.toJson());
    String ?id;
    String ?altura;
    String ?peso;
    String ?idade;
    String ?sexo;
    String ?imc;

    Pessoa({
        this.id,
        this.altura,
        this.peso,
        this.idade,
        this.sexo,
        this.imc,
    });

}

