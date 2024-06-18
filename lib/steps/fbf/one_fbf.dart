import 'package:flutter/material.dart';
import 'package:interface_app/controlador_pages/models/dados_model_fbf.dart';

class OneFBF extends StatefulWidget {
  const OneFBF({super.key});

  @override
  State<OneFBF> createState() => _OneFBFState();
}

class _OneFBFState extends State<OneFBF> {
  late TextEditingController qndtListas;
  late TextEditingController maiorQue;
  late TextEditingController menorQue;
  late DadosModelFBF model;
  late TextEditingController qndtFormulas;

  bool Conjuncao = false;
  bool Bimplicacao = false;
  bool Implicacao = false;
  bool Disjuncao = false;
  bool Negacao = false;
  int quantidadeListas = 0;
  int quantidadeFormulas = 0;
  int v1 = 0;
  int v2 = 0;

  @override
  void initState() {
    super.initState();
    maiorQue = TextEditingController();
    menorQue = TextEditingController();
    qndtFormulas = TextEditingController();
    qndtListas = TextEditingController();
  }

  @override
  void dispose() {
    maiorQue.dispose();
    menorQue.dispose();
    qndtFormulas.dispose();
    qndtListas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text('Passo #1', style: Theme.of(context).textTheme.headline3,),
            ],
          ),
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  controller: maiorQue, 
                  onChanged: (String value) {
                    v1 = int.parse(value);
                  },
                  decoration: InputDecoration(
                    label: const Text('Mínimo'),
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(7)),
              Expanded(flex: 1, child: Text('#Átomos', style: Theme.of(context).textTheme.headline6,)),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: menorQue, 
                  onChanged: (String value) {
                    v2 = int.parse(value);
                  },
                  decoration:  InputDecoration(
                    label: const Text('Máximo'),
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(8)),
          TextField(
            controller: qndtFormulas, 
            onChanged: (String value) {
              quantidadeFormulas = int.parse(value);
            },
            decoration: InputDecoration(
              label: const Text('Quantidade de fórmulas'),
              hintStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: qndtListas, 
            onChanged: (String value) {
              quantidadeListas = int.parse(value);
            },
            decoration:  InputDecoration(
              label: const Text('Quantidade de listas'),
              hintStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text('Selecione as operações', style: Theme.of(context).textTheme.headline6),
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
          label: 'Disjunção',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: Disjuncao,
          onChanged: (bool newValue) {
            setState(() {
              Disjuncao = newValue;
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
            height: 40,
            width: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () {
              String quantidadeAtomos = '$v1, $v2';
              if (v1 == v2) {
                quantidadeAtomos = '$v1';
              } else if (v1 > v2) {
                Navigator.pushNamed(context, '/six_fbf');
              }

              var model = DadosModelFBF(qntdAtomos: quantidadeAtomos, qntdFormulas: quantidadeFormulas, qntdListas: quantidadeListas, operadoresLogicos: gerarFrase(Conjuncao, Bimplicacao, Implicacao, Disjuncao, Negacao));
              print(model.qntdAtomos);
              print(model.qntdFormulas);
              print(model.qntdListas);
              print(model.operadoresLogicos);
              Navigator.pushNamed(context, '/five_fbf', arguments: model);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 16),),
            ),
          )
        ],
      )
    );
  }
}

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
          Checkbox(
            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.green.withOpacity(.32);
              }
              return Colors.green;
            }),
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 16,),),
          ),
        ],
      ),
    );
  }
}

String gerarFrase(bool Conjuncao, bool Bimplicacao, bool Implicacao, bool Disjuncao, bool Negacao) {
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
  if (Disjuncao) {
    frase += 'DISJUNÇÃO,';
  }
  if (Negacao) {
    frase += 'NEGAÇÃO';
  }

  return frase;
}