import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_fbf.dart';

class SixFBF extends StatefulWidget {
  const SixFBF({super.key});

  @override
  State<SixFBF> createState() => _SixFBF();
}

class _SixFBF extends State<SixFBF> {
  late DadosModelFBF model;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(content: Text('ERRO!'),),
    );
    /*Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(model.fetch() as String)
        ],
    );*/
  }
}