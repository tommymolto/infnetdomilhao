import 'package:flutter/cupertino.dart';

import '../models/pergunta_model.dart';
import '../repositories/partida_repository.dart';

class PartidaController extends ValueNotifier{
  late int totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late int indicePergunta = 0;
  late List<PerguntaModel> perguntas = [];
  final PartidaRepository partidaRepository ;
  PartidaController(this.partidaRepository) : super(null);
  getPerguntas() async{
    perguntas = await partidaRepository.getPerguntas();
    notifyListeners();
  }
}