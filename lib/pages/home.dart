import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/pages/partida.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import 'package:provider/provider.dart';

import 'jogo.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      MultiProvider(
        providers: [
          Provider<DadosApi>.value(value:  DadosApi()),
          Provider<PartidaRepository>.value(value:  PartidaRepository(
            dadosApi:  DadosApi()
          )),
          ChangeNotifierProvider(create: ( context) => PartidaController(context.read<PartidaRepository>()))
        ],
        child: MaterialApp(
          //darkTheme: ThemeData.dark(),
          title: 'Infnet do Milhao',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const Jogo(),
            '/partida': (context) {
              return const Partida();
            }
          },
        )
      )
      ;
  }

}