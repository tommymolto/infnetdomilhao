import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infnetdomilhao/DAO/ranking_dao.dart';

import '../models/ranking.dart';

class RankingPage extends StatefulWidget {
  final RankingDao rankingDao;

  const RankingPage({Key? key, required this.rankingDao}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {

  late RankingDao dao;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     dao = widget.rankingDao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
            stream: dao.getAllRankingSorted(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


              if (snapshot.hasError) {
                return Center(child: (Text('${snapshot.error}')));
              } else if (snapshot.hasData) {
                var listRanking = snapshot.data as List<Ranking>;
                // print('listRanking= ${ listRanking.toString() }');
                return Column(
                  children: listRanking.map((e) {
                     return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Nome: ${e.nome} '),
                        Text('Valor: ${e.valor}'),
                      ],
                    );
                  }).toList(),
                )
                 ;
                //return const Center(child: (Text('Tenho conteudo')));
              }
              return const Center(child: (Text('Nao devo existir')));
            }));
  }
}
