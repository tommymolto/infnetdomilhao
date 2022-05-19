
import 'package:floor/floor.dart';

@entity
class Ranking{

  @PrimaryKey(autoGenerate: true)
  int? id;

  String? nome;
  int? valor;

  Ranking({ this.id, this.nome, this.valor});
}