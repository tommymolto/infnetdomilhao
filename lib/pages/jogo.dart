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
      ]
    },
    {
      'pergunta': 'Qual é o nome dado ao estado da água em forma de gelo?',
      'respostas': [
        'Liquido',
        'Solido',
        'Gasoso',
        'Vaporoso',
      ]
    }, {
      'pergunta': 'Qual era o apelido da cantora Elis Regina?',
      'respostas': [
        'GAUCHINHA',
        'PAULISTINHA',
        'PIMENTINHA',
        'ANDORINHA',
      ]
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
  var indice = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    //respostas.shuffle();

    return Pergunta(
      pergunta: perguntas[indice]!['pergunta'] as String,
      respostas: perguntas[indice]['respostas'] as List<String>,
      onClick: _onClicked,
    );
  }

  _onClicked(String valor) {
    setState(() {
      escolhas.add(valor);
      indice++;
      print(indice);
      print(escolhas);
    });
    escolhas.add(valor);
    print(valor);
    //stdout.writeln(valor);
  }
}
