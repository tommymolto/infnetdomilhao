import '../models/pergunta_model.dart';

abstract class IDadosApi {
  late final String arquivoDados;
  Future<List<PerguntaModel>> carregaDados() ;
}