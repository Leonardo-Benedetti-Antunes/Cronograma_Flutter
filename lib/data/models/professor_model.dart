import 'dart:convert';

ProfessorModel professorModelFromJson(String str) => ProfessorModel.fromJson(json.decode(str));

String professorModelToJson(ProfessorModel data) => json.encode(data.toJson());

class ProfessorModel {
  int id;
  String nome;
  String descricao;
  bool ativo;
  bool segunda;
  bool terca;
  bool quarta;
  bool quinta;
  bool sexta;

  ProfessorModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.ativo,
    required this.segunda,
    required this.terca,
    required this.quarta,
    required this.quinta,
    required this.sexta,
  });

  factory ProfessorModel.fromJson(Map<String, dynamic> json) => ProfessorModel(
        id: json["id"] ?? 0,
        nome: json["nome"] ?? "Sem Nome",
        descricao: json["descricao"] ?? "Sem Descrição",
        ativo: json["ativo"] ?? false,
        segunda: json["segunda"] ?? false,
        terca: json["terca"] ?? false,
        quarta: json["quarta"] ?? false,
        quinta: json["quinta"] ?? false,
        sexta: json["sexta"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "ativo": ativo,
        "segunda": segunda,
        "terca": terca,
        "quarta": quarta,
        "quinta": quinta,
        "sexta": sexta,
      };

  String disponibilidade() {
    return [
      if (segunda) "Segunda",
      if (terca) "Terça",
      if (quarta) "Quarta",
      if (quinta) "Quinta",
      if (sexta) "Sexta",
    ].join(", ");
  }
}
