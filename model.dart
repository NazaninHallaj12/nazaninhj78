import 'package:get/get.dart';

class TodoData {
  String title;
  String description;
  bool isDone;

  static RxList<TodoData> data = RxList<TodoData>([]);

  TodoData(
      {required this.title, required this.description, required this.isDone});
}
