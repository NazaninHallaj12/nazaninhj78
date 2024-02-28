import 'package:get/get.dart';
import 'package:untitled17/data_model/model.dart';
import 'package:untitled17/pages/add_todo/view/add_todo_view.dart';


class HomeController extends GetxController {
  RxString titlePage = RxString('Todo Lists');
  void todoPage() {
    Get.toNamed(AddTodo.addTodoRoute);
  }

  void editTask(int index) {
    Get.toNamed(AddTodo.addTodoRoute, arguments: index);
  }

  void deleteTask(int index) {
    TodoData.data.removeAt(index);
  }
}
