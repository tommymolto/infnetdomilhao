import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/pergunta.dart';

class DadosApi {
  final String arquivoDados;

  const DadosApi({this.arquivoDados = 'assets/perguntas.json'});

  Future<List<PerguntaModel>> carregaDados() async {
    var jsonText = await rootBundle.loadString(arquivoDados);
    Iterable l = json.decode(jsonText);

    return List<PerguntaModel>.from(
        l.map((model) => PerguntaModel.fromJson(model)));
  }
}
