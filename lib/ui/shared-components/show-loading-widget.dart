import 'package:flutter/material.dart';

///Class para criar Animação de carregamento na telas
class ShowLoadingWidget {
  //Passa-se um texto para apresentar junto com o loading
  static showLoadingLabel(BuildContext context, String labelTexto) async {
    var loading = _createLoading(context, labelTexto);
    return loading;
  }

  //Criar um loading com o "aguarde" por padrão
  static showLoading(BuildContext context) async {
    var loading = _createLoading(context, "Aguarde...");
    return loading;
  }

  static _createLoading(BuildContext context, String labelTexto) async {
    var loading = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Row(
            children: [
              CircularProgressIndicator(),
              Container(
                  margin: EdgeInsets.only(left: 30), child: Text(labelTexto)),
            ],
          ),
        );
      },
    );
    return loading;
  }
}
