import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ModalPublico extends StatelessWidget{

  final PerguntaModel perguntaModel;

  const ModalPublico({Key? key, required this.perguntaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: charts.BarChart(
      _criaVotosPublico(perguntaModel),
      animate: true
    ));
  }
  List<charts.Series<dynamic, String>> _criaVotosPublico(PerguntaModel perguntas){
    List<Map<String, Object>> _data =[];
    Random random =  Random();
    int randomico = random.nextInt(11);
    final _percentagens = [12,28,20];
    for(final resposta in perguntas.respostas){
      if(resposta.resposta.toString() == perguntas.certa.toString()){
        _data.add({'resposta': resposta.resposta.toString(), 'percentagem': 50 + randomico});
      }else{
        _data.add({'resposta': resposta.resposta.toString(), 'percentagem': _percentagens[0] - (randomico/3).round()});
        _percentagens.removeAt(0);
      }
    }
    print('lista=${_data.toString()}');

    return [
      charts.Series<dynamic, String>(
        id: 'Publico',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_data, _) => _data['resposta'],
        measureFn: (_data, _) => _data['percentagem'],
        data: _data,
      )
    ];
  }


}