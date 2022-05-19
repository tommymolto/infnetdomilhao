import 'package:flutter/material.dart';
import 'package:infnetdomilhao/pages/home.dart';
import 'package:infnetdomilhao/pages/jogo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/pergunta.dart';
import 'infra/infnet_database.dart';

late SharedPreferences sharedPrefs ;
late AppDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sharedPrefs = await SharedPreferences.getInstance();
  database =
  await $FloorAppDatabase.databaseBuilder('infnetdomilhao.db').build();
  runApp(const HomePage() );
}
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Home();
  }

}


