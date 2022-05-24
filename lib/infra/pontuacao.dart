import 'package:infnetdomilhao/models/pontuacao_model.dart';

class Pontuacao{
  List<PontuacaoModel> pontuacao = [
    const PontuacaoModel(valor: 500, portoSeguro: 0, tipoPergunta: 'FACIL'),
    const PontuacaoModel(valor: 1000, portoSeguro: 0, tipoPergunta: 'FACIL'),
    const PontuacaoModel(valor: 2000 , portoSeguro: 0, tipoPergunta: 'FACIL'),
    const PontuacaoModel(valor: 3000, portoSeguro: 0, tipoPergunta: 'FACIL'),
    const PontuacaoModel(valor: 5000, portoSeguro: 0, tipoPergunta: 'FACIL'),
    const PontuacaoModel(valor: 10000, portoSeguro: 5000, tipoPergunta: 'MEDIA'),
    const PontuacaoModel(valor: 15000, portoSeguro: 5000, tipoPergunta: 'MEDIA'),
    const PontuacaoModel(valor: 20000, portoSeguro: 5000, tipoPergunta: 'MEDIA'),
    const PontuacaoModel(valor: 30000, portoSeguro: 5000, tipoPergunta: 'MEDIA'),
    const PontuacaoModel(valor: 50000, portoSeguro: 5000, tipoPergunta: 'MEDIA'),
    const PontuacaoModel(valor: 100000, portoSeguro: 50000, tipoPergunta: 'DIFICIL'),
    const PontuacaoModel(valor: 150000, portoSeguro: 50000 , tipoPergunta: 'DIFICIL'),
    const PontuacaoModel(valor: 300000, portoSeguro: 50000 , tipoPergunta: 'DIFICIL'),
    const PontuacaoModel(valor: 500000  , portoSeguro: 50000 , tipoPergunta: 'DIFICIL'),
    const PontuacaoModel(valor: 1000000  , portoSeguro: 50000 , tipoPergunta: 'DIFICIL'),
  ];

}