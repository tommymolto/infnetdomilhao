import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/models/resposta_model.dart';

class SimpleBarChart extends StatelessWidget {
  final PerguntaModel pergunta;
  final bool animate;

  const SimpleBarChart({
    Key? key,
    required this.pergunta,
    required this.animate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: charts.BarChart(
      _createSampleData(),
      animate: animate,
    ));
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<dynamic, String>> _createSampleData() {
    List<Map<String, Object>> _data =[];
    Random random = new Random();
    int randomico = random.nextInt(10);
    final _percentagens = [12,28,20];
    for(final resposta in pergunta.respostas){
      if(resposta.resposta.toString() == pergunta.certa.toString()){
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
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (_data, _) => _data['resposta'],
        measureFn: (_data, _) => _data['percentagem'],
        data: _data,
      )
    ];
  }
}
