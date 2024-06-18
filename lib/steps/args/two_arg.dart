import 'package:flutter/material.dart';
import 'package:interface_app/controlador_pages/models/dados_model_arg.dart';

class TwoARG extends StatefulWidget {
  const TwoARG({super.key});

  @override
  State<TwoARG> createState() => _OneARGState();
}

class _OneARGState extends State<TwoARG> {
  late DadosModelARG model;
  late TextEditingController qntdListas;
  int quantidadeListas = 0;

  @override
  void initState() {
    super.initState();
    qntdListas = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelARG;
     });
  }

  @override
  void dispose() {
    qntdListas.dispose();
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
            controller: qntdListas, 
            onChanged: (String value) {
              quantidadeListas = int.parse(value);
            },
            decoration: const InputDecoration(
              hintText: "Quantidade de Listas",
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
              var dadosModel = model.copyWith(qntdListas: quantidadeListas);
              Navigator.pushNamed(context, '/three_arg', arguments: dadosModel);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
            ),
            )
        ],
      )
    );
  }
}