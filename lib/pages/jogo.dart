import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/partida.dart';

class Jogo extends StatelessWidget{
  const Jogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
       title: const Text('Infnet do Milhao'),
    backgroundColor: Colors.blue ,
    ),
    body:  Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children:  [
       Image.asset('showdomilhao.png'),
       ElevatedButton(onPressed: () {
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => const Partida()),
         );
       }, child: Text('Jogar')),
       ElevatedButton(onPressed: null, child: const Text('Ranking')),
     ],
   )
   );
  }

}