import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';

class Partida extends StatefulWidget {
  const Partida({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PartidaState();
}

class _PartidaState extends State<Partida> {
  var totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late int indicePergunta = 0;
  late List<PerguntaModel> perguntas = [];

  Future<List<PerguntaModel>> _loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/perguntas.json');
    Iterable l = json.decode(jsonText);


    return List<PerguntaModel>.from(l.map((model)=> PerguntaModel.fromJson(model)));

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJsonData().then((data) => setState((){
      perguntas = data;
    }));
    indicePergunta = 0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: const Text('Partida do Milhao'),
    ),
    body:Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Pontos: $totalPontos',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            flex: 1),
        Expanded(
            child: indicePergunta < perguntas.length ? Pergunta(
              pergunta: perguntas[indicePergunta].pergunta ,
              respostas: perguntas[indicePergunta].respostas ,
              indice: indicePergunta,
              onClick: _onClicked,
            ) :  Center(
                child: Column(
                  children: [
                    const SizedBox(
                      child: Text('Fim de Jogo!'),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: _resetGame,
                        child: Text('Reiniciar?'),
                      ),
                    )
                  ],
                )

            ),
            flex: 5),
      ],
    )
    );
  }
  _resetGame(){
    setState(() {
      totalPontos=0;
      escolhas.clear();
      indicePergunta = 0;
    });

  }
  _onClicked(String valor, int indice) {
    setState(() {
      if (valor == perguntas[indice].certa) totalPontos++;
      escolhas.add(valor);
      indicePergunta++;
    });

    print(valor);
    //stdout.writeln(valor);
  }
}
