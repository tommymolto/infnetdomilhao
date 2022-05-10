import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/home.dart';
import 'package:infnetdomilhao/pages/jogo.dart';
import './pages/pergunta.dart';

void main() {
  runApp(const HomePage() );
}
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Home();
  }

}


