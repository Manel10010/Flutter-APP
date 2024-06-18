import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_fbf.dart';

class ThreeFBF extends StatefulWidget {
  const ThreeFBF({super.key});

  @override
  State<ThreeFBF> createState() => _ThreeFBFState();
}

class _ThreeFBFState extends State<ThreeFBF> {
  late DadosModelFBF model;
  late TextEditingController qndtListas;
  int quantidadeListas = 0;

  @override
  void initState() {
    super.initState();
    qndtListas = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
     });
  }

  @override
  void dispose() {
    qndtListas.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Passo #3', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: qndtListas, 
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
              Navigator.pushNamed(context, '/four_fbf', arguments: dadosModel);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
            ),
            )
        ],
      )
    );
  }
}