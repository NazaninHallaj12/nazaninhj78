import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_todo_controller.dart';

class AddTodo extends GetView<AddTodoController> {
  const AddTodo({super.key});

  static const String addTodoRoute = '/AddTodo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.titlePage.value),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _input_Title(),
              _height(16),
              Expanded(
                  child: Column(
                    children: [_input_Description(), _height(12), _checkBox()],
                  )),
              _buttons()
            ],
          ),
        ));
  }

  Widget _checkBox() {
    return Obx(() => Row(
      children: [
        Text('Is it complete?', style: TextStyle(fontSize: 16)),
        Checkbox(
          value: controller.isDone.value,
          onChanged: (value) {
            controller.isDone.value = value!;
          },
        ),
      ],
    ));
  }

  Widget _buttons() {
    return Row(
      children: [
        Expanded(
          child: _button_Add(),
        ),
        _width(16),
        Expanded(
          child: _button_Cancel(),
        ),
      ],
    );
  }

  Widget _width(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget _height(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _button_Cancel() {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          controller.cancelAdd();
        },
        child: Text(
          'Cancel',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }

  Widget _button_Add() {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          controller.addTodo();
        },
        child: Text(
          controller.index != null ? 'Save' : 'Add',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
    );
  }

  Widget _input_Description() {
    return TextField(
      maxLines: 5,
      controller: controller.descriptionController.value,
      decoration: const InputDecoration(
          labelText: 'Description',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.pink,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.deepPurple))),
    );
  }

  Widget _input_Title() {
    return TextField(
      maxLines: 1,
      controller: controller.titelController.value,
      decoration: InputDecoration(
          labelText: 'Title',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.pink,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.deepPurple))),
    );
  }
}
