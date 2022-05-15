
import 'package:faker/faker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infnetdomilhao/DAO/ranking_dao.dart';
import 'package:infnetdomilhao/models/ranking.dart';

import '../infra/infnet_database.dart';





class RankingPage extends StatefulWidget {
  RankingPage({Key? key, this.dao});

  final RankingDao? dao;

  @override
  _RankingPageState createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Ranking'),
        actions: [
          IconButton(
              onPressed: () async {
                final ranking = Ranking(
                    nome: Faker().person.firstName(),
                    valor: Faker().person.hashCode,
                    );
                await widget.dao!.insertRanking(ranking);
                showSnackBar(scaffoldKey.currentState, 'Adicionado com sucesso');
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                widget.dao!.deleteAllRanking();
                setState(
                        (){
                      showSnackBar(scaffoldKey.currentState, 'Ranking deletado');
                    }
                );
              },
              icon: const Icon(Icons.clear)),
        ],
      ),
      body: StreamBuilder(
        stream: widget.dao!.getAllRankingSorted(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: (Text('${snapshot.error}')));
          } else if (snapshot.hasData) {
            var listRanking = snapshot.data as List<Ranking>;
            return Container(
              color: Colors.black12,
              padding: const EdgeInsets.all(0),
              child: ListView.builder(
                  itemCount: listRanking != null ? listRanking.length : 0,
                  itemBuilder: (context, index) {
                    return Slidable(
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 20),
                          tileColor: Colors.black12,
                          title: Text('${listRanking[index].nome} ', style: const TextStyle(color: Colors.black, fontSize: 18),),
                          subtitle: Text('${listRanking[index].valor}', style: const TextStyle(color: Colors.black, fontSize: 14)),
                        ),
                    startActionPane:  ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            label: 'Atualizar',
                            backgroundColor: Colors.pink,
                            icon: Icons.update,
                            onPressed: (BuildContext context) async{
                              final updateRanking = listRanking[index];
                              updateRanking.nome = Faker().person.firstName();
                              updateRanking.valor = Faker().person.hashCode;
                              await widget.dao!.updateRanking(updateRanking);

                              showSnackBar(scaffoldKey.currentState, 'Atualizado');

                            },
                          ),
                          SlidableAction(
                            label: 'Remover',
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (BuildContext context) async{
                              final deleteRanking = listRanking[index];
                              await widget.dao!.deleteRanking(deleteRanking);
                              showSnackBar(scaffoldKey.currentState, 'Removido');
                            },
                          )
                        ],
                    ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

void showSnackBar(ScaffoldState? currentState, String s) {
  final snackBar = SnackBar(
    content: Text(s),
    duration: const Duration(seconds: 1),
  );
  currentState!.showSnackBar(snackBar);
}