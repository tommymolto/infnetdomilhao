import 'package:flutter/material.dart';
import './pages/pergunta.dart';

void main() {
  runApp(const HomePage() );
}
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
        //darkTheme: ThemeData.dark(),
        color: Colors.amberAccent,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Infnet do Milhao'),
            backgroundColor: Colors.blue ,
          ),
          body: Pergunta(),
        )
    );
  }

}


