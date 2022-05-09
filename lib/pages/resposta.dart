import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infnetdomilhao/models/resposta_model.dart';

class Resposta extends StatelessWidget {
  final String textoResposta;
  final IconData iconData;
  final Function function;
  final Color cor;
  final int indice;
  final RespostaModel respostaModel;

  const Resposta({
    Key? key,
    required this.textoResposta,
    required this.iconData,
    required this.function,
    required this.indice, required this.cor,
    required this.respostaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(respostaModel.enabled);
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: respostaModel.enabled == false ?  MaterialStateProperty.all(Colors.grey): MaterialStateProperty.all(cor),
            maximumSize:  MaterialStateProperty.all(const Size(22, 48)),
            minimumSize:  MaterialStateProperty.all(const Size(22, 48)) ,
            enableFeedback: respostaModel.enabled,
          ),
          onPressed: () {
            function(textoResposta, indice);
            //function(textoResposta);
          },
          label: Text(textoResposta,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                // backgroundColor: cor,
              )),
          icon: Icon(
              iconData,
              size: 44.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
