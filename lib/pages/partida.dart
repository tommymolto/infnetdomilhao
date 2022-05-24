import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/models/ranking.dart';
import 'package:infnetdomilhao/pages/modal_publico.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';
import 'package:provider/provider.dart';

import '../DAO/ranking_dao.dart';
import '../main.dart';
import '../models/resposta_model.dart';
import 'botao_jogador.dart';
import 'fim_jogo.dart';
import 'jogo.dart';

enum TipoModal { Publico, Amigo }

class Partida extends StatefulWidget {
  final RankingDao rankingDao;

  const Partida({Key? key, required this.rankingDao}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartidaState();
}

class _PartidaState extends State<Partida> {
  var totalPontos = 0;
  late List<RespostaModel> escolhas = [];
  late String pergunta;
  late List<PerguntaModel> perguntas = [];
  late RankingDao dao;
  late bool _gameOver = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PartidaController>(context, listen: false).getPerguntas();
    Provider.of<PartidaController>(context, listen: false).indicePergunta = 0;
    Provider.of<PartidaController>(context, listen: false).getPontuacao();
    dao = widget.rankingDao;
  }

  @override
  Widget build(BuildContext context) {
    final ctl = context.watch<PartidaController>();

    final _indicePergunta = ctl.indicePergunta;
    final sentido = MediaQuery.of(context).orientation;
    final filhos = [
      Expanded(
          child: Text(
            'Valendo :\n R\$ ${ctl.pontuacao[ctl.indicePergunta].valor}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          flex: 1),
      BotaoJogador(
        enabled: ctl.ajudas.contains(Ajudas.MeioAMeio) ? true : false,
        texto: 'Meio a Meio ',
        onClick: _clickMeioAMeio,
      ),
      BotaoJogador(
          enabled: ctl.ajudas.contains(Ajudas.Amigo) ? true : false,
          texto: 'Amigo ',
          onClick: () {
            _mostrarModal(ctl.perguntas[ctl.indicePergunta], TipoModal.Amigo,
                Ajudas.Amigo);
          }),
      BotaoJogador(
          enabled: ctl.ajudas.contains(Ajudas.Publico) ? true : false,
          texto: 'Publico ',
          onClick: () {
            _mostrarModal(ctl.perguntas[ctl.indicePergunta], TipoModal.Publico,
                Ajudas.Publico);
          }),
      BotaoJogador(
          enabled: true,
          texto:
              'Desistir por ${ctl.pontuacao[ctl.indicePergunta].portoSeguro} ',
          onClick: () {
            final nome = sharedPrefs.getString('NomeJogador') ?? 'Anonymous';
            _salvaFimDeJogo(
                nome, ctl.pontuacao[ctl.indicePergunta].portoSeguro);
          })
    ];

    ;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partida do Milhao'),
      ),
      body: sentido == Orientation.portrait
          ? Column(children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: filhos,
                      )))
            ,
        Expanded(
            child: (_indicePergunta < ctl.perguntas.length) && !_gameOver
                ? Pergunta(
              pergunta: ctl.perguntas[_indicePergunta].pergunta,
              respostas: ctl.perguntas[_indicePergunta].respostas,
              indice: ctl.indicePergunta,
              onClick: _onClicked,
            )
                : FimJogo(
              nomeJogador: sharedPrefs.getString('NomeJogador')!,
              pontuacao: ctl.pontuacao[ctl.indicePergunta].portoSeguro,
              onResetClick: _resetGame,
            ),
            flex: 5)])
          : Row(children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: filhos,
                      )))
            ,Expanded(
            child: (_indicePergunta < ctl.perguntas.length) && !_gameOver
                ? Pergunta(
              pergunta: ctl.perguntas[_indicePergunta].pergunta,
              respostas: ctl.perguntas[_indicePergunta].respostas,
              indice: ctl.indicePergunta,
              onClick: _onClicked,
            )
                : FimJogo(
              nomeJogador: sharedPrefs.getString('NomeJogador')!,
              pontuacao: ctl.pontuacao[ctl.indicePergunta].portoSeguro,
              onResetClick: _resetGame,
            ),
            flex: 5)]),
    );
  }

  _resetGame() {
    setState(() {
      Provider.of<PartidaController>(context, listen: false).totalPontos = 0;
      Provider.of<PartidaController>(context, listen: false).escolhas.clear();
      Provider.of<PartidaController>(context, listen: false).indicePergunta = 0;
    });
  }

  _onClicked(String valor, int indice) {
    setState(() {
      if (valor ==
          Provider.of<PartidaController>(context, listen: false)
              .perguntas[indice]
              .certa) {
        Provider.of<PartidaController>(context, listen: false).totalPontos++;
        Provider.of<PartidaController>(context, listen: false)
            .escolhas
            .add(valor);
        Provider.of<PartidaController>(context, listen: false).indicePergunta++;
      } else {
        final nome = sharedPrefs.getString('NomeJogador') ?? 'Anonymous';
        _salvaFimDeJogo(
            nome,
            Provider.of<PartidaController>(context, listen: false)
                .pontuacao[
                    Provider.of<PartidaController>(context, listen: false)
                        .indicePergunta]
                .portoSeguro);
      }

      // print(Provider.of<PartidaController>(context, listen: false).indicePergunta);
    });
    //stdout.writeln(valor);
  }

  _mostrarModal(
      PerguntaModel perguntaModel, TipoModal tipoModal, Ajudas ajuda) {
    setState(() {
      Provider.of<PartidaController>(context, listen: false).usarAjuda(ajuda);
    });
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              tipoModal == TipoModal.Publico
                  ? ModalPublico(perguntaModel: perguntaModel)
                  : Text(
                      'Meu amigo ${sharedPrefs.getString('NomeJogador')}, eu acho que a resposta é ${perguntaModel.certa} '),
            ],
          );
        });
  }

  _clickMeioAMeio() {
    setState(() {
      Provider.of<PartidaController>(context, listen: false)
          .usarAjuda(Ajudas.MeioAMeio);
      Provider.of<PartidaController>(context, listen: false)
          .usarAjudaMeioAMeio();
    });
  }

  _salvaFimDeJogo(String nomeJogador, int valorGanho) {
    //dao.
    Ranking ranking = Ranking(nome: nomeJogador, valor: valorGanho);
    dao.insertRanking(ranking);
    setState(() {
      _gameOver = true;
    });
  }
}
