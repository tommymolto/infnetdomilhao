import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/models/resposta_model.dart';
import 'package:infnetdomilhao/pages/resposta.dart';

class Pergunta extends StatelessWidget {
  final String pergunta;
  final List<RespostaModel> respostas;
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
                        textoResposta: respostas[0].resposta.toString(),
                        iconData: Icons.circle,
                        respostaModel: respostas[0],
                        function: onClick,
                        indice: indice,
                        cor: respostas[0].enabled == false ? Colors.grey: Colors.red ,
                      ),
                      Resposta(
                        textoResposta: respostas[1].resposta.toString(),
                        respostaModel: respostas[1],

                        iconData: Icons.square,
                        function: onClick,
                        indice: indice,
                        cor: respostas[1].enabled == false ? Colors.grey: Colors.yellow ,
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
                      textoResposta: respostas[2].resposta.toString(),
                      iconData: Icons.star,
                      function: onClick,
                      indice: indice,
                      cor: respostas[2].enabled == false ? Colors.grey: Colors.orange ,
                      respostaModel: respostas[2],
                    ),
                    Resposta(
                      textoResposta: respostas[3].resposta.toString(),
                      iconData: Icons.add,
                      function: onClick,
                      indice: indice,
                      cor: respostas[3].enabled == false ? Colors.grey: Colors.blue ,
                      respostaModel: respostas[3],

                    ),
                  ],
                )),
              )
            ],
          )),
    );
  }
}
