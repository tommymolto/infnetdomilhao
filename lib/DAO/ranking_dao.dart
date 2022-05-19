
import 'package:floor/floor.dart';

import '../models/ranking.dart';

@dao
abstract class RankingDao{

  @Query('SELECT * FROM Ranking')
  Stream<List<Ranking>> getAllRanking();

  @Query('SELECT * FROM Ranking order by valor desc')
  Stream<List<Ranking>> getAllRankingSorted();

  @Query('SELECT * FROM Ranking WHERE id = :id')
  Stream<Ranking?> getAllRankingBYID(int id);

  @Query('DELETE FROM Ranking')
  Future<void> deleteAllRanking();

  @insert
  Future<void> insertRanking(Ranking rnk);

  @update
  Future<void> updateRanking(Ranking rnk);

  @delete
  Future<void> deleteRanking(Ranking rnk);

}