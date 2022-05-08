import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/partida.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import 'package:provider/provider.dart';

class Jogo extends StatelessWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Scaffold(
        appBar: AppBar(
          title: const Text('Infnet do Milhao'),
          backgroundColor: Colors.blue ,
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('showdomilhao.png'),
            ElevatedButton(
              child: Text('Jogar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Partida()),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Ranking'),
              onPressed: () {},
            )
          ],
        ),
      )
    ;
  }
}
