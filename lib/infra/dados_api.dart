import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:infnetdomilhao/interfaces/IDadosApi.dart';

import '../models/pergunta_model.dart';

class DadosApi extends IDadosApi{
  final String arquivoDados;

   DadosApi({this.arquivoDados = 'assets/perguntas.json'});
  Future<List<PerguntaModel>> carregaDados() async {
    var jsonText = await rootBundle.loadString(arquivoDados);
    Iterable l = json.decode(jsonText);

    return List<PerguntaModel>.from(
        l.map((model) => PerguntaModel.fromJson(model)));
  }
}