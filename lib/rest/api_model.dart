import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiModelFBF {
  int? atomos;
  int? formulas;
  int? listas;
  String? operadoresLogicos;
  String? envolvidos;
  
  ApiModelFBF(int atom, int lista, String operadores, String env, int forms) {
    atomos = atom;
    listas = lista;
    operadoresLogicos = operadores;
    envolvidos = env;
    formulas = forms;
  }

  Future<Map> fetch() async {
  var url = Uri.parse('http://127.0.0.1:8080/api-logic/$atomos/$formulas/$listas/$operadoresLogicos/$envolvidos/');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return json;
  }
}