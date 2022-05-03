import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/resposta.dart';

class Pergunta extends StatelessWidget {
  final String pergunta;
  final List<String> respostas;
  final Function onClick;
  const Pergunta({Key? key, required this.respostas, required this.pergunta, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    respostas.shuffle();
    const indice = 0;
    return Center(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Expanded(
                flex: 3,
                child: Text(
                    pergunta),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Resposta(textoResposta: respostas[0].toString(), iconData: Icons.circle, function: onClick),
                      Resposta(textoResposta: respostas[1].toString(), iconData: Icons.square, function: onClick),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Resposta(textoResposta: respostas[2].toString(), iconData: Icons.star, function: onClick),
                    Resposta(textoResposta: respostas[3].toString(), iconData: Icons.add, function: onClick),

                  ],
                )),
              )
            ],
          )),
    );
  }


}
