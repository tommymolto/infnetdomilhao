import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoJogador extends StatelessWidget {
  final bool enabled;
  final String texto;
  final Function onClick;

  const BotaoJogador(
      {Key? key, required this.enabled, required this.texto, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('enabled=$enabled');
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: ElevatedButton(
              onPressed: enabled ? () {
                onClick();
              }: null,
              child: Text(texto),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: const EdgeInsets.all(10.0),
                textStyle: const TextStyle(
                    fontSize: 8, fontWeight: FontWeight.bold),
              )),
        ),
        flex: 1);
  }

}