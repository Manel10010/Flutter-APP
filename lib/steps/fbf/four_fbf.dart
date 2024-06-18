import 'package:flutter/material.dart';
import '../../controlador_pages/models/dados_model_fbf.dart';

class CheckBoxWidgetFBF extends StatelessWidget {
  const CheckBoxWidgetFBF({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(label, style: TextStyle(fontSize: 24, ),),
          ),
          Checkbox(
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}

class FourFBF extends StatefulWidget {
  const FourFBF({super.key});

  @override
  State<FourFBF> createState() => _FourFBFState();
}

class _FourFBFState extends State<FourFBF> {
  late DadosModelFBF model;
  bool Conjuncao = false;
  bool Bimplicacao = false;
  bool Implicacao = false;
  bool Dijuncao = false;
  bool Negacao = false;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = ModalRoute.of(context)?.settings.arguments as DadosModelFBF;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Passo #4', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          CheckBoxWidgetFBF(
          label: 'Conjunção',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Conjuncao,
          onChanged: (bool newValue) {
            setState(() {
              Conjuncao = newValue;
            });
          },
        ),
          CheckBoxWidgetFBF(
          label: 'Bimplicação',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Bimplicacao,
          onChanged: (bool newValue) {
            setState(() {
              Bimplicacao = newValue;
            });
          },
        ),
          CheckBoxWidgetFBF(
          label: 'Implicação',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Implicacao,
          onChanged: (bool newValue) {
            setState(() {
              Implicacao = newValue;
            });
          },
        ),
          CheckBoxWidgetFBF(
          label: 'Dijunção',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Dijuncao,
          onChanged: (bool newValue) {
            setState(() {
              Dijuncao = newValue;
            });
          },
        ),
          CheckBoxWidgetFBF(
          label: 'Negação',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Negacao,
          onChanged: (bool newValue) {
            setState(() {
              Negacao = newValue;
            });
          },
        ),
          SizedBox(
            height: 70,
            width: 190,
            child: ElevatedButton(
              onPressed: () {
              var dadosModel = model.copyWith(operadoresLogicos: gerarFrase(Conjuncao, Bimplicacao, Implicacao, Dijuncao, Negacao));
              Navigator.pushNamed(context, '/five_fbf', arguments: dadosModel);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
            ),
            )
        ],
      )
    );
  }
}

String gerarFrase(bool Conjuncao, bool Bimplicacao, bool Implicacao, bool Dijuncao, bool Negacao) {
  String frase = '';
  //Colocando as operações na frase
  if (Conjuncao) {
    frase += 'CONJUNCAO,';
  }
  if (Bimplicacao) {
    frase += 'BIMPLICAÇÃO,';
  }
  if (Implicacao) {
    frase += 'IMPLICAÇÃO,';
  }
  if (Dijuncao) {
    frase += 'DIJUNÇÃO,';
  }
  if (Negacao) {
    frase += 'NEGAÇÃO';
  }

  return frase;
}