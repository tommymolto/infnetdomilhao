import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'jogo.dart';

class FimJogo extends StatelessWidget {
  final String nomeJogador;
  final int pontuacao;
  final Function onResetClick;

  const FimJogo(
      {Key? key, required this.nomeJogador, required this.pontuacao, required this.onResetClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
          children: [
            Text('Fim de Jogo!'),
            Text(
                '$nomeJogador ganhou R\$ $pontuacao'),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                onResetClick;
                },
                  child: Text('Reiniciar')

              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Jogo()));
                },
                child: Text('Sair'),
              ),
            ),
          ],
        ));
  }

}