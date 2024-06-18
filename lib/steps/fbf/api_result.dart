import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_fbf.dart';
import '../../rest/api_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late DadosModelFBF model;
  //late DadosModelFBF dadosModel;
  late ApiModelFBF apiDados;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
      var dadosModel = model.copyWith();
      setState(() {
        apiDados = ApiModelFBF(dadosModel.qntdAtomos as int, dadosModel.qntdListas as int, dadosModel.operadoresLogicos as String, dadosModel.envolvidos as String, dadosModel.qntdFormulas as int);
      });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(apiDados.fetch() as String),
        ],
      ),
    );
  }
}