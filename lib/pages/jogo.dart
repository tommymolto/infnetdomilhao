import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var totalPontos = 0;
  late List<String> escolhas = [];
  late String pergunta;
  late int indicePergunta = 0;
  late List<Map<String, dynamic>> perguntas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    perguntas = [
      {
        'pergunta': 'Em que estado brasileiro nasceu a apresentadora Xuxa?',
        'respostas': [
          'RIO DE JANEIRO',
          'RIO GRANDE DO SUL',
          'SANTA CATARINA',
          'GOIÁS',
        ],
        'certa': 'RIO GRANDE DO SUL'
      },
      {
        'pergunta': 'Qual é o nome dado ao estado da água em forma de gelo?',
        'respostas': [
          'Liquido',
          'Solido',
          'Gasoso',
          'Vaporoso',
        ],
        'certa': 'Solido'
      },
      {
        'pergunta': 'Qual era o apelido da cantora Elis Regina?',
        'respostas': [
          'GAUCHINHA',
          'PAULISTINHA',
          'PIMENTINHA',
          'ANDORINHA',
        ],
        'certa': 'PIMENTINHA'
      },
      {
        'pergunta': 'Quem é a namorada do Mickey?',
        'respostas': [
          'MARGARIDA',
          'MINNIE',
          'A PEQUENA SEREIA',
          'OLÍVIA PALITO',
        ],
        'certa': 'MINNIE'
      },
      {
        'pergunta':
            'Qual é o personagem do folclore brasileiro que tem uma perna só?',
        'respostas': [
          'CUCA',
          'Negrinho do Pastoreiro',
          'Boitatá',
          'Saci Pererê',
        ],
        'certa': 'Saci Pererê'
      }
    ];
    indicePergunta = 0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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
              pergunta: perguntas[indicePergunta]['pergunta'] as String,
              respostas: perguntas[indicePergunta]['respostas'] as List<String>,
              indice: indicePergunta,
              onClick: _onClicked,
            ) :  Center(
              child: Column(
                children: [
                      SizedBox(
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
      if (valor == perguntas[indice]['certa']) totalPontos++;
      escolhas.add(valor);
      indicePergunta++;
    });

    print(valor);
    //stdout.writeln(valor);
  }
}
