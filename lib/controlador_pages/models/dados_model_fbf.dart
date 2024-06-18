import 'dart:convert';
import 'package:http/http.dart' as http;

class DadosModelFBF {
  final String? qntdAtomos;
  final int? qntdFormulas;
  final int? qntdListas;
  final String? operadoresLogicos;
  final String? envolvidos;

  DadosModelFBF ({this.qntdAtomos,this.qntdFormulas, this.qntdListas, this.operadoresLogicos, this.envolvidos});

  //String operadoresLogicos

  DadosModelFBF copyWith({
  String? qntdAtomos, 
  int? qntdFormulas, 
  int? qntdListas, 
  String? operadoresLogicos,
  String? envolvidos,
  }) {
    return DadosModelFBF(
      qntdAtomos: qntdAtomos ?? this.qntdAtomos,
      qntdFormulas: qntdFormulas ?? this.qntdFormulas,
      qntdListas: qntdListas ?? this.qntdListas,
      operadoresLogicos: operadoresLogicos ?? this.operadoresLogicos,
      envolvidos: envolvidos ?? this.envolvidos,

    );
  }

  Future<List> fetch() async {
    final url = Uri.parse('http://127.0.0.1:8080/api-logic/$qntdAtomos/$qntdFormulas/$qntdListas/$operadoresLogicos/$envolvidos/');
    final response = await http.get(url);
    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
    return responseMap;
  }
}