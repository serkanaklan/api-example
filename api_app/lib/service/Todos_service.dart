import 'dart:convert';

import 'package:api_app/model/todos_model.dart';
import 'package:http/http.dart' as http;

class Todos_Service {
  static final List<TodosModel> todosmodel = [];
  Future<List<TodosModel>> getTodos() async {
    const String apiurl = "https://jsonplaceholder.typicode.com/todos/";
    final response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      print(response.body);

      final List<dynamic> todoslist = jsonDecode(response.body);
      for (var i = 0; i < todoslist.length; i++) {
        print(todoslist.length);
        todosmodel.add(TodosModel.fromJson(todoslist[i]));
      }
      return todosmodel;
    }
    throw Exception(response.statusCode);
  }
}
