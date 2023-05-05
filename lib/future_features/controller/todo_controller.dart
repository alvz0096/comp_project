import 'package:comp_project/future_features/models/todo.dart';
import 'package:comp_project/future_features/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  //get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

  Future<String> updatePutCompleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }

  Future<String> deletetCompleted(Todo todo) async {
    return _repository.deletedTodo(todo);
  }
}
