import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final IconData iconData;
  final Function function;
  final int indice;
  const Resposta(
      {Key? key, required this.textoResposta, required this.iconData, required this.function, required this.indice,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton.icon(
          onPressed: () {
            function(textoResposta, indice);
            //function(textoResposta);
          },
          label: Text(textoResposta),
          icon: Icon(
              iconData
          ),
        ),
      ),
    );
  }

}