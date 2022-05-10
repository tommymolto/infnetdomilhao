import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:infnetdomilhao/interfaces/IDadosApi.dart';

import '../models/pergunta_model.dart';

class CacheApi extends IDadosApi{
  late String arquivoDados;

   CacheApi({this.arquivoDados = 'assets/perguntas.json'});
  Future<List<PerguntaModel>> carregaDados() async {
    var x = const PerguntaModel(tipo: "FACIL", pergunta: "teste", respostas: ['A','B', 'C', 'D' ], certa: 'D');

    return [x];
  }
}