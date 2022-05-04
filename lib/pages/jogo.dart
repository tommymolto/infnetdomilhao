import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  State<StatefulWidget> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var total = 0;
  late List<String> escolhas = [];
  late String pergunta;
  var perguntas = [
    {
      'pergunta': 'Em que estado brasileiro nasceu a apresentadora Xuxa?',
      'respostas': [
        'RIO DE JANEIRO',
        'RIO GRANDE DO SUL',
        'SANTA CATARINA',
        'GOIÁS',
      ],
      'certa':'RIO GRANDE DO SUL'
    },
    {
      'pergunta': 'Qual é o nome dado ao estado da água em forma de gelo?',
      'respostas': [
        'Liquido',
        'Solido',
        'Gasoso',
        'Vaporoso',
      ],
      'certa':'Solido'
    }, {
      'pergunta': 'Qual era o apelido da cantora Elis Regina?',
      'respostas': [
        'GAUCHINHA',
        'PAULISTINHA',
        'PIMENTINHA',
        'ANDORINHA',
      ],
      'certa': 'PIMENTINHA'
    },
    {

      'pergunta': 'Quem é a namorada do Mickey?',
      'respostas': [
        'MARGARIDA',
        'MINNIE',
        'A PEQUENA SEREIA',
        'OLÍVIA PALITO',
      ]

    }
  ];
  var indicePergunta = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    //respostas.shuffle();

    return indicePergunta < perguntas.length ? Column(
      children: [
        Expanded(child: Text('Total de Pontos: $total'), flex:1),
        Expanded(child: Pergunta(
          pergunta: perguntas[indicePergunta]!['pergunta'] as String,
          respostas: perguntas[indicePergunta]['respostas'] as List<String>,
          indice: indicePergunta,
          onClick: _onClicked,
        ), flex: 5,)
        ,
      ],
    ) : Center(
        child: SizedBox(
          child: Text('Fim! Você ganhou $total pontos'),
        ),
    );
  }

  _onClicked(String valor, int indice) {
    setState(() {
      if(valor == perguntas[indice]['certa']) total++;
      escolhas.add(valor);
      indicePergunta++;

    });
    escolhas.add(valor);
    print(valor);
    //stdout.writeln(valor);
  }
}
