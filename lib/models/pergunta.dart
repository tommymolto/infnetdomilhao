import 'package:equatable/equatable.dart';

class PerguntaModel extends Equatable {
  final String tipo;
  final String pergunta;
  final List<String> respostas;
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
      'respostas': List<dynamic>.from(respostas.map((x) => x)),
      'certa': certa,
    };
  }

  @override
  String toString() => toJson().toString();

  static fromJson(Map<String, dynamic> json) {
    return PerguntaModel(
      tipo: json['tipo'] as String,
      pergunta: json['pergunta'] as String,
      respostas: List<String>.from(json["respostas"].map((x) => x)),
      certa: json['certa'] as String,
    );
  }
}
