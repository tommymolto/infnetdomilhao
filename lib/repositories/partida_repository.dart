import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/models/pergunta.dart';

import '../infra/pontuacao.dart';
import '../models/pontuacao_model.dart';

class PartidaRepository{

   final DadosApi dadosApi;
   final Pontuacao pontuacao;

   PartidaRepository({this.dadosApi = const DadosApi(), required this.pontuacao});
   getPerguntas() async{
     return  await dadosApi.carregaDados();
   }
   Future<List<PerguntaModel>> getPerguntasParaPartida() async{
      final todasPerguntas = await dadosApi.carregaDados();
      final perguntasFaceis = todasPerguntas.where((element) => element.tipo == 'FACIL').take(5);
      final perguntasMedias = todasPerguntas.where((element) => element.tipo == 'MEDIO').take(5);
      final perguntasDificeis = todasPerguntas.where((element) => element.tipo == 'DIFICIL').take(5);
      print(perguntasFaceis);
      print(perguntasMedias);
      print(perguntasDificeis);
      final novaLista =  List<PerguntaModel>.from(perguntasFaceis)
         ..addAll(perguntasMedias)
         ..addAll(perguntasDificeis);
      return  novaLista;
   }
   Future<List<PontuacaoModel>> getPontuacao() async{
      return await pontuacao.pontuacao;
   }



}