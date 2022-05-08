import 'package:infnetdomilhao/infra/dados_api.dart';
import 'package:infnetdomilhao/models/pergunta.dart';

class PartidaRepository{

   final DadosApi dadosApi;
   PartidaRepository({this.dadosApi = const DadosApi()});
   getPerguntas() async{
     return  await dadosApi.carregaDados();
   }




}