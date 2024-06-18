import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_fbf.dart';

enum Envolvidos { todosEnvolvidos, aoMenosUmEnvolvido }

class FiveFBF extends StatefulWidget {
  const FiveFBF({super.key});

  @override
  State<FiveFBF> createState() => _FiveFBF();
}

class _FiveFBF extends State<FiveFBF> {
  Envolvidos? _character = Envolvidos.todosEnvolvidos;
  late DadosModelFBF model;

  //Variáveis pra o status GERAL
  late String textoTela;
  late String qntdAtomos;
  late int qntdFormulas;
  late int qntdListas;
  late String operadores;
  late String envolvidos;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { //Pegando o model
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
      print(model.toString());
      setState(() {
        qntdAtomos = model.qntdAtomos as String;
        qntdFormulas = model.qntdFormulas as int;
        qntdListas = model.qntdListas as int;
        operadores = model.operadoresLogicos as String;
        textoTela = model.operadoresLogicos.toString().replaceAll(',', '\n');
      });
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(250, 250, 250, 250),
        child: Column(
          children: <Widget>[
            Text('Passo #2', style: Theme.of(context).textTheme.headline3,),
            const Padding(padding: EdgeInsets.all(10)),
            Text('Dados Gerais', style: Theme.of(context).textTheme.headline3,),
            const Padding(padding: EdgeInsets.all(10)),
            //Text('Elementos envolvidos: $envolvidos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text('#Átomos: $qntdAtomos', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text('#Formulas: $qntdFormulas', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            Text('#Listas: $qntdListas', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            const Padding(padding: EdgeInsets.all(10)),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 20.0), child: const Text('Dado as operações envolvidas: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                Text(textoTela, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
              ],
            ),
            const Text('As formulas terão em sua criação:',  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            RadioListTile<Envolvidos>(
              activeColor: Colors.green,
              title: const Text('Todas as operações envolvidas'),
              value: Envolvidos.todosEnvolvidos,
              groupValue: _character,
              onChanged: (Envolvidos? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Envolvidos>(
              activeColor: Colors.green,
              title: const Text('Ao menos uma operação envolvida'),
              value: Envolvidos.aoMenosUmEnvolvido,
              groupValue: _character,
              onChanged: (Envolvidos? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                  var dadosModel = model.copyWith(envolvidos: _character.toString());
                  dadosModel.fetch();
                }, 
                  child: const Text('Finalizar', style: TextStyle(fontSize: 16),),
                ),
                )
          ],
        ),
      ),
    );
  }
}