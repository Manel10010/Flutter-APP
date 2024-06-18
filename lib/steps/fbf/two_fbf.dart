import 'package:flutter/material.dart';
import 'package:interface_app/controlador_pages/models/dados_model_fbf.dart';

class TwoFBF extends StatefulWidget {
  const TwoFBF({super.key});

  @override
  State<TwoFBF> createState() => _OneFBFState();
}

class _OneFBFState extends State<TwoFBF> {
  late DadosModelFBF model;
  late TextEditingController qndtFormulas;
  int quantidadeFormulas = 0;

  @override
  void initState() {
    super.initState();
    qndtFormulas = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
     });
  }

  @override
  void dispose() {
    qndtFormulas.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Passo #2', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: qndtFormulas, 
            onChanged: (String value) {
              quantidadeFormulas = int.parse(value);
            },
            decoration: const InputDecoration(
              hintText: "Quantidade de Fórmulas",
              hintStyle: TextStyle(fontSize: 24),
              border: OutlineInputBorder(),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          SizedBox(
            height: 70,
            width: 190,
            child: ElevatedButton(
              onPressed: () {
              var dadosModel = model.copyWith(qntdFormulas: quantidadeFormulas);
              Navigator.pushNamed(context, '/three_fbf', arguments: dadosModel);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
            ),
            )
        ],
      )
    );
  }
}