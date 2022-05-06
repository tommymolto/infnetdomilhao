import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/partida.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';

class Jogo extends StatelessWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
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
              child: Text('Ranking'),
              onPressed: () {},
            )
          ],
        );
  }
}
