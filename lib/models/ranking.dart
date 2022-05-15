import 'package:floor/floor.dart';

@entity
class Ranking{

  @PrimaryKey(autoGenerate: true)
  int? id;
  String? nome;
  int? valor;
  DateTime data = DateTime.now();
  Ranking({ this.id, this.nome,  this.valor, required this.data});
}