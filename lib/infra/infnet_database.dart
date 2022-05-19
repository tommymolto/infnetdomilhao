import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:infnetdomilhao/DAO/ranking_dao.dart';

import '../models/ranking.dart';

part 'infnet_database.g.dart';

@Database(version: 1, entities: [Ranking])
abstract class AppDatabase extends FloorDatabase{
  RankingDao get rankingDao;
}