import 'dart:convert';
import 'package:comp_project/future_features/repository/repository.dart';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoRepository implements Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com';
  @override
  Future<String> deletedTodo(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.delete(url).then((response) {
      return resData = 'true';
    });
    return resData;
  }

  //get Example
  @override
  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    //print('status code: ${response.statusCode}');

    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }

    return todoList;
  }

  // patch example
  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.patch(
      url,
      body: {
        'completed': {!todo.completed!}.toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.put(
      url,
      body: {
        'completed': {!todo.completed!}.toString(),
      },
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> postTodo(Todo todo) async {
    var url = Uri.parse('$dataURL/todos/${todo.id}');
    String resData = '';
    await http.delete(url).then((response) {
      return resData = 'true';
    });
    return resData;
  }
}
