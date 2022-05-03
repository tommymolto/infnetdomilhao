import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/resposta.dart';

class Pergunta extends StatelessWidget {
  const Pergunta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var respostas = [
      'RIO DE JANEIRO',
      'RIO GRANDE DO SUL',
      'SANTA CATARINA',
      'GOIÁS',
    ];
    respostas.shuffle();
    const indice = 0;
    return Center(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                    'Em que estado brasileiro nasceu a apresentadora Xuxa ? '),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Resposta(textoResposta: respostas[0].toString(), iconData: Icons.circle, function: _onClicked),
                      Resposta(textoResposta: respostas[1].toString(), iconData: Icons.square, function: _onClicked),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Resposta(textoResposta: respostas[2].toString(), iconData: Icons.star, function: _onClicked),
                    Resposta(textoResposta: respostas[3].toString(), iconData: Icons.add, function: _onClicked),

                  ],
                )),
              )
            ],
          )),
    );
  }

  _onClicked(String valor) {
    print(valor);
    //stdout.writeln(valor);
  }
}
