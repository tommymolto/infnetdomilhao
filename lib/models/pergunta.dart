import 'package:equatable/equatable.dart';
import 'package:infnetdomilhao/models/resposta_model.dart';

class PerguntaModel extends Equatable {
  final String tipo;
  final String pergunta;
  final List<RespostaModel> respostas;
  final String certa;

  const PerguntaModel({
    required this.tipo,
    required this.pergunta,
    required this.respostas,
    required this.certa,
  });

  @override
  // TODO: implement props
  List<Object> get props => [tipo, pergunta, respostas, certa];

  Map<String, dynamic> toJson() {
    return {
      'tipo': tipo,
      'pergunta': pergunta,
      'respostas': List<dynamic>.from(respostas.map((x) => RespostaModel(resposta: x.toString()))).toString(),
      'certa': certa,
    };
  }

  @override
  String toString() => toJson().toString();

  static fromJson(Map<String, dynamic> json) {
    return PerguntaModel(
      tipo: json['tipo'] as String,
      pergunta: json['pergunta'] as String,
      respostas: List<RespostaModel>.from(json["respostas"].map((x) => RespostaModel(resposta: x))),
      certa: json['certa'] as String,
    );
  }
}
