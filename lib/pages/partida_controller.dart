import 'package:flutter/cupertino.dart';
import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/models/pontuacao_model.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import '../models/pergunta.dart';
enum Ajudas{
  Publico,
  Amigo,
  MeioAMeio
}
class PartidaController extends ChangeNotifier{
  late int totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late int indicePergunta = 0;
  late List<PontuacaoModel> pontuacao;
  late List<PerguntaModel> perguntas = [];
  final ajudas = [Ajudas.Amigo, Ajudas.MeioAMeio, Ajudas.Publico];

  final PartidaRepository partidaRepository ;
  PartidaController(this.partidaRepository);


  getPerguntas() async{
    //perguntas = await partidaRepository.getPerguntas();
    perguntas = await partidaRepository.getPerguntasParaPartida();
    notifyListeners();
  }
  getPontuacao() async{
    pontuacao = await partidaRepository.getPontuacao();
  }
  usarAjuda(Ajudas aj){
    switch (aj){
      case Ajudas.Publico:
        break;
      case Ajudas.Amigo:
        break;
      case Ajudas.MeioAMeio:
        break;
    }

  }
  usarAjudaMeioAMeio(){
    var meio = true;
    for (var element in perguntas[indicePergunta].respostas) {
      if(perguntas[indicePergunta].certa == element.resposta){
        element.enabled = true;
      }else if(meio == true){
        element.enabled = true;
        meio = false;
      } else{
        element.enabled = false;
      }
    }

  }
  preenchePerguntasEPontos(){

  }
}