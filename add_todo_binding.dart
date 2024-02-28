import 'package:get/get.dart';
import 'package:untitled17/pages/add_todo/controller/add_todo_controller.dart';

class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(() => AddTodoController(), fenix: true);
  }
}
