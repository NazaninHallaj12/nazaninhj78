import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled17/data_model/model.dart';

class AddTodoController extends GetxController {
  RxString titlePage = RxString('Add Todo');

  Rx<TextEditingController> titelController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  RxBool isDone = RxBool(false);
  final index = Get.arguments;
  @override
  void onInit() {
    if (index != null) {
      titelController.value.text = TodoData.data[index].title;
      descriptionController.value.text = TodoData.data[index].description;
      isDone.value = TodoData.data[index].isDone;
    }
    super.onInit();
  }

  void cancelAdd() {
    titelController.value.clear();
    descriptionController.value.clear();
    isDone.value = false;
    Get.back();
  }

  void addTodo() {
    if (index == null) {
      TodoData.data.add(TodoData(
        title: titelController.value.text,
        description: descriptionController.value.text,
        isDone: isDone.value,
      ));
      titelController.value.clear();
      descriptionController.value.clear();
      isDone.value = false;
      Get.back();
    } else {
      TodoData.data[index].title = titelController.value.text;
      TodoData.data[index].description = descriptionController.value.text;
      TodoData.data[index].isDone = isDone.value;
      titelController.value.clear();
      descriptionController.value.clear();
      isDone.value = false;
      Get.back();
    }
  }
}
