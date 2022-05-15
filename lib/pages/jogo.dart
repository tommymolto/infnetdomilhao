import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/main.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/partida.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import 'package:provider/provider.dart';
class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JogoState();
}
class _JogoState extends State<Jogo> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller =  TextEditingController(text: sharedPrefs.getString('PlayerName') ?? 'PlayerName');
  }

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
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entre com o nome do jogador',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Jogar'),
              onPressed: () {
                setState(() {
                  sharedPrefs.setString('PlayerName', _controller.text);
                });
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
