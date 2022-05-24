import 'package:flutter/cupertino.dart';
import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import '../models/pergunta.dart';
import '../models/pontuacao_model.dart';
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
  late List<PerguntaModel> perguntas = [];
  late List<Ajudas> ajudas =[];
  late List<PontuacaoModel> pontuacao = [];

  final PartidaRepository partidaRepository ;
  PartidaController(this.partidaRepository);
  getPerguntas() async{
    //perguntas = await partidaRepository.getPerguntas();
    ajudas = [Ajudas.Amigo, Ajudas.MeioAMeio, Ajudas.Publico];
    perguntas = await partidaRepository.getPerguntasParaPartida();
    notifyListeners();
  }
  getPergunta(){

  }
  usarAjuda(Ajudas aj){
    switch (aj){
      case Ajudas.Publico:
        ajudas.remove(Ajudas.Publico);
        break;
      case Ajudas.Amigo:
        ajudas.remove(Ajudas.Amigo);
        break;
      case Ajudas.MeioAMeio:
        ajudas.remove(Ajudas.MeioAMeio);
        break;
    }
    notifyListeners();

  }
  usarAjudaMeioAMeio(){

    var meio = true;
    for (var element in perguntas[indicePergunta].respostas) {
      if(perguntas[indicePergunta].certa == element.resposta){
        element.enabled = true;
      }else if(meio == true){
        element.enabled = true;
        meio = false;
      }else{
        element.enabled = false;
      }

    }

    notifyListeners();

  }
  getPontuacao() async{
    pontuacao = await partidaRepository.getPontuacao();
    notifyListeners();
  }

}