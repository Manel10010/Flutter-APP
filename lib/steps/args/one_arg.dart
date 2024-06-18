import 'package:flutter/material.dart';
import 'package:interface_app/controlador_pages/models/dados_model_arg.dart';

class OneARG extends StatefulWidget {
  const OneARG({super.key});

  @override
  State<OneARG> createState() => _OneARGState();
}

class _OneARGState extends State<OneARG> {
  bool _NE = false; 
  bool _NI = false;
  bool _CI = false;
  bool _CE = false;
  bool _DI = false;
  bool _DE = false;
  bool _BE = false;
  bool _BI = false;
  bool _MP = false;
  bool _MT = false;
  bool _SD = false;
  bool _MD = false;
  
  late TextEditingController qntdArgumentos;
  late TextEditingController qntdListas;

  int quantidadeListas = 0;
  int quantidadeArgumentos = 0;

  @override
  void initState() {
    super.initState();
    qntdArgumentos = TextEditingController();
    qntdListas = TextEditingController();
  }

  @override
  void dispose() {
    qntdArgumentos.dispose();
    qntdListas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Passo #1', style: Theme.of(context).textTheme.headline3,),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: qntdArgumentos, 
            onChanged: (String value) {
              quantidadeArgumentos = int.parse(value);
            },
            decoration:  InputDecoration(
              label: const Text('Quantidade de Argumentos'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: qntdListas, 
            onChanged: (String value) {
              quantidadeListas = int.parse(value);
            },
            decoration: InputDecoration(
              label: const Text('Quantidade de Listas'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          CheckBoxWidgetARGS(
            label: 'NE',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _NE,
            onChanged: (bool newValue) {
              setState(() {
                _NE = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'NI',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _NI,
            onChanged: (bool newValue) {
              setState(() {
                _NI = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'CI',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _CI,
            onChanged: (bool newValue) {
              setState(() {
                _CI = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'CE',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _CE,
            onChanged: (bool newValue) {
              setState(() {
                _CE = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'DI',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _DI,
            onChanged: (bool newValue) {
              setState(() {
                _DI = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'DE',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _DE,
            onChanged: (bool newValue) {
              setState(() {
                _DE = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'BE',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _BE,
            onChanged: (bool newValue) {
              setState(() {
                _BE = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'BI',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _BI,
            onChanged: (bool newValue) {
              setState(() {
                _BI = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'MP',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _MP,
            onChanged: (bool newValue) {
              setState(() {
                _MP = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'MT',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _MT,
            onChanged: (bool newValue) {
              setState(() {
                _MT = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'SD',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _SD,
            onChanged: (bool newValue) {
              setState(() {
                _SD = newValue;
              });
            },
          ),
          CheckBoxWidgetARGS(
            label: 'MD',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _MD,
            onChanged: (bool newValue) {
              setState(() {
                _MD = newValue;
              });
            },
          ),
          SizedBox(
            height: 70,
            width: 190,
            child: ElevatedButton(
              onPressed: () {
              var model = DadosModelARG(qntdArgumentos: quantidadeArgumentos, qntdListas: quantidadeListas, regrasInferencia: gerarFrase(_NE, _NI, _CI, _CE, _DI, _DE, _BE, _BI, _MP, _MT, _SD, _MD));
              Navigator.pushNamed(context, '/four_arg', arguments: model);
            }, 
              child: const Text('Proximo passo', style: TextStyle(fontSize: 22),),
            ),
          )
        ],
      )
    );
  }
}

class CheckBoxWidgetARGS extends StatelessWidget {
  const CheckBoxWidgetARGS({
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

String gerarFrase(bool NE, bool NI, bool CI, bool CE, bool DI, bool DE, bool BE, bool BI, bool MP, bool MT, bool SD, bool MD,) {
  String frase = '';
  //Colocando as operações na frase
  if (NE) {
    frase += 'NE, ';
  }
  if (NI) {
    frase += 'NI, ';
  }
  if (CI) {
    frase += 'CI, ';
  }
  if (CE) {
    frase += 'CE, ';
  }
  if (DI) {
    frase += 'DI, ';
  }
  if (DE) {
    frase += 'DE, ';
  }
  if (BE) {
    frase += 'DE, ';
  }
  if (BI) {
    frase += 'BI, ';
  }
  if (MP) {
    frase += 'MP, ';
  }
  if (MT) {
    frase += 'MT, ';
  }
  if (SD) {
    frase += 'SD, ';
  }
  if (MD) {
    frase += 'MD';
  }


  return frase;
}