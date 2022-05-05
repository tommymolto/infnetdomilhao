import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/resposta.dart';

class Pergunta extends StatelessWidget {
  final String pergunta;
  final List<String> respostas;
  final int indice;
  final Function onClick;

  const Pergunta(
      {Key? key,
      required this.pergunta,
      required this.respostas,
      required this.indice,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    respostas.shuffle();

    return Center(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    pergunta,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // backgroundColor: Colors.cyanAccent.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Resposta(
                        textoResposta: respostas[0].toString(),
                        iconData: Icons.circle,
                        function: onClick,
                        indice: indice,
                        cor: Colors.cyanAccent,
                      ),
                      Resposta(
                        textoResposta: respostas[1].toString(),
                        iconData: Icons.square,
                        function: onClick,
                        indice: indice,
                        cor: Colors.yellow,
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Resposta(
                      textoResposta: respostas[2].toString(),
                      iconData: Icons.star,
                      function: onClick,
                      indice: indice,
                      cor: Colors.deepOrange,
                    ),
                    Resposta(
                      textoResposta: respostas[3].toString(),
                      iconData: Icons.add,
                      function: onClick,
                      indice: indice,
                      cor: Colors.lightGreenAccent
                    ),
                  ],
                )),
              )
            ],
          )),
    );
  }
}
