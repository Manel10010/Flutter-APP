import 'dart:convert';
import 'package:http/http.dart' as http;

class DadosModelARG {
  final int? qntdArgumentos;
  final int? qntdListas;
  final String? regrasInferencia;
  final String? envolvidos;

  DadosModelARG ({this.qntdArgumentos, this.qntdListas, this.regrasInferencia, this.envolvidos});

  DadosModelARG copyWith({
  int? qntdArgumentos, 
  int? qntdListas, 
  String? regrasInferencia,
  String? envolvidos,
  }) {
    return DadosModelARG(
      qntdArgumentos: qntdArgumentos ?? this.qntdArgumentos,
      qntdListas: qntdListas ?? this.qntdListas,
      regrasInferencia: regrasInferencia ?? this.regrasInferencia,
      envolvidos: envolvidos ?? this.envolvidos,

    );
  }

  Future<List> fetch() async {
    final url = Uri.parse('http://127.0.0.1:8080/api-logic/$qntdArgumentos/$qntdListas/$regrasInferencia/$envolvidos/');
    final response = await http.get(url);
    final List<Map<String, dynamic>> responseMap = jsonDecode(response.body);
    return responseMap;
  }
}