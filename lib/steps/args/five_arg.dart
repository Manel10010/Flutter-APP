import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_arg.dart';

class FiveARG extends StatefulWidget {
  const FiveARG({super.key});

  @override
  State<FiveARG> createState() => _FiveARG();
}

class _FiveARG extends State<FiveARG> {
  late DadosModelARG model;
  late int qntdArgumentos;
  late int qntdListas;
  late String regrasInferencia;
  late String envolvidos;

  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelARG;
      setState(() {
        qntdArgumentos = model.qntdArgumentos as int;
        qntdListas = model.qntdListas as int;
        regrasInferencia = model.regrasInferencia as String;
        if (model.envolvidos == 'Envolvidos.todosEnvolvidos') {
          envolvidos = 'Todos envolvidos';
        } else {
          envolvidos = 'Ao menos um envolvido';
        }
      });
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Dados Gerais', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          //Text('Elementos envolvidos: $envolvidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text('#Formulas: $qntdArgumentos', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('#Listas: $qntdListas', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Text('Dado as regras: $regrasInferencia', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Text('As formulas conterão: : $envolvidos', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const Padding(padding: EdgeInsets.all(10)),
          SizedBox(
              height: 70,
              width: 190,
              child: ElevatedButton(
                onPressed: () {
                //Passo API
                //var dadosModel = model.copyWith();
                //Navigator.pushNamed(context, '/six_fbf', arguments: dadosModel);
              }, 
                child: const Text('Finalizar', style: TextStyle(fontSize: 22),),
              ),
              )
        ],
    );
  }
}