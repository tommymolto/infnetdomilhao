import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';
import 'package:provider/provider.dart';

class Partida extends StatefulWidget {
  const Partida({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartidaState();
}

class _PartidaState extends State<Partida> {
  var totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late List<PerguntaModel> perguntas = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PartidaController>(context, listen: false).getPerguntas();

  }

  @override
  Widget build(BuildContext context) {
    final ctl  = context.watch<PartidaController>();

    final _indicePergunta = context.watch<PartidaController>().indicePergunta;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: const Text('Partida do Milhao'),
    ),
    body:Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Pontos: ${ context.watch<PartidaController>().totalPontos}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            flex: 1),
        Expanded(
            child: _indicePergunta < ctl.perguntas.length ? Pergunta(
              pergunta: ctl.perguntas[_indicePergunta].pergunta ,
              respostas: ctl.perguntas[_indicePergunta].respostas ,
              indice: ctl.indicePergunta,
              onClick: _onClicked,
            ) :  Center(
                child: Column(
                  children: [
                    const SizedBox(
                      child: Text('Fim de Jogo!'),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: _resetGame,
                        child: Text('Reiniciar?'),
                      ),
                    )
                  ],
                )

            ),
            flex: 5),
      ],
    )
    );
  }
  _resetGame(){
    setState(() {
      Provider.of<PartidaController>(context, listen: false).totalPontos=0;
      Provider.of<PartidaController>(context, listen: false).escolhas.clear();
      Provider.of<PartidaController>(context, listen: false).indicePergunta = 0;
    });

  }
  _onClicked(String valor, int indice) {
    setState(() {
      if (valor == Provider.of<PartidaController>(context, listen: false).perguntas[indice].certa) {
        Provider.of<PartidaController>(context, listen: false).totalPontos++;
      }
        Provider.of<PartidaController>(context, listen: false).escolhas.add(valor);
        Provider.of<PartidaController>(context, listen: false).indicePergunta++;
        print(Provider.of<PartidaController>(context, listen: false).indicePergunta);

    });

    print(valor);
    //stdout.writeln(valor);
  }
}
