import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_arg.dart';

enum Envolvidos { todosEnvolvidos, aoMenosUmEnvolvido }

class FourARG extends StatefulWidget {
  const FourARG({super.key});

  @override
  State<FourARG> createState() => _FourARG();
}

class _FourARG extends State<FourARG> {
  Envolvidos? _character = Envolvidos.todosEnvolvidos;
  late DadosModelARG model;
  late String textoTela;
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
        textoTela = model.regrasInferencia.toString().replaceAll(',', '\n');
      });
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Passo #2', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          Text('Dados Gerais', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          //Text('Elementos envolvidos: $envolvidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text('#Formulas: $qntdArgumentos', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('#Listas: $qntdListas', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          Text('Dado as regras: $textoTela', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const Text('As formulas conterão:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const Padding(padding: EdgeInsets.all(10)),
          RadioListTile<Envolvidos>(
            title: const Text('Todos as regras envolvidas'),
            value: Envolvidos.todosEnvolvidos,
            groupValue: _character,
            onChanged: (Envolvidos? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          RadioListTile<Envolvidos>(
            title: const Text('Ao menos uma das regras envolvida'),
            value: Envolvidos.aoMenosUmEnvolvido,
            groupValue: _character,
            onChanged: (Envolvidos? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          SizedBox(
              height: 70,
              width: 190,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                var dadosModel = model.copyWith(envolvidos: _character.toString());
                Navigator.pushNamed(context, '/five_arg', arguments: dadosModel);
              }, 
                child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
              ),
              )
        ],
      ),
    );
  }
}