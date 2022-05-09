
class RespostaModel {
  final String resposta;
  late bool? enabled;
  final int? percentagem;

  RespostaModel(
      { required this.resposta, this.enabled = true, this.percentagem = 25,});
  Map<String, dynamic> toJson() {
    return {
      'resposta': resposta,
      'enabled': enabled,
      'percentagem': percentagem,
    };
  }
}