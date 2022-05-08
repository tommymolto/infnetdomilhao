import 'package:flutter/cupertino.dart';
import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import '../models/pergunta.dart';

class PartidaController extends ChangeNotifier{
  late int totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late int indicePergunta = 0;
  late List<PerguntaModel> perguntas = [];

  final PartidaRepository partidaRepository ;
  PartidaController(this.partidaRepository);
  getPerguntas() async{
    perguntas = await partidaRepository.getPerguntas();
    notifyListeners();
  }
  getPergunta(){

  }
}