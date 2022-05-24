import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infnetdomilhao/DAO/ranking_dao.dart';
import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/infra/pontuacao.dart';
import 'package:infnetdomilhao/models/pergunta.dart';
import 'package:infnetdomilhao/pages/partida.dart';
import 'package:infnetdomilhao/pages/partida_controller.dart';
import 'package:infnetdomilhao/pages/pergunta.dart';
import 'package:infnetdomilhao/repositories/partida_repository.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'jogo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dao = database.rankingDao;

    // TODO: implement build
    return  MultiProvider(providers:  [
      //Provider<RankingDao>.value(value: RankingDao()),
      Provider<DadosApi>.value(value: const DadosApi()),
      Provider<PartidaRepository>.value(value: PartidaRepository(
        dadosApi: const DadosApi(), pontuacao: Pontuacao(),
      )),

      //ChangeNotifierProvider(create: (_) => PartidaRepository()),
      ChangeNotifierProvider(create: (context) =>  PartidaController(context.read<PartidaRepository>())),
    ],
      child: MaterialApp(
        title: 'Infnet do milhao',
        theme: ThemeData(
          //scaffoldBackgroundColor: Colors.blue,
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Jogo(),
          '/partida': (context) {
            return  Partida( rankingDao: dao,
            );
          },
        },
        //darkTheme: ThemeData.dark(),
        /*color: Colors.amberAccent,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Infnet do Milhao'),
            backgroundColor: Colors.blue ,
          ),

      ),)*/
    ),
    )
    ;
  }
}
