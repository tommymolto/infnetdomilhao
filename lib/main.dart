import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/home.dart';
import 'package:infnetdomilhao/pages/jogo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/pergunta.dart';
late SharedPreferences sharedPrefs ;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // mandatory when awaiting on main

  sharedPrefs = await SharedPreferences.getInstance();
  runApp(const HomePage() );
}
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Home();
  }

}


