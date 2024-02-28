import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled17/data_model/model.dart';
import 'package:untitled17/pages/home/controller/home_controller.dart';

class HomeApp extends GetView<HomeController> {
  const HomeApp({super.key});

  static const String homeRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          controller.titlePage.value,
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: _floating_Button(),
      body: _background_ListView(),
    );
  }

  Widget _background_ListView() {
    return Obx(() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                Colors.purple.shade100,
                Colors.purple.shade300,
                Colors.purple.shade400,
                Colors.purple.shade600,
                Colors.purple.shade700,
              ]),
        ),
        child: TodoData.data.isEmpty ? _empty() : _listView()));
  }

  Widget _listView() {
    return Obx(() => ListView.builder(
      itemCount: TodoData.data.length,
      itemBuilder: (context, index) {
        return Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: TodoData.data[index].isDone != true
                  ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.pink.shade500,
                    Colors.pink.shade50
                  ])
                  : LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Colors.purple.shade500,
                    Colors.yellow.shade50
                  ]),
            ),
            child: _content(index));
      },
    ));
  }

  Widget _floating_Button() {
    return FloatingActionButton(
      onPressed: () {
        controller.todoPage();
      },
      child: const Icon(
        Icons.add,
        size: 32,
      ),
    );
  }

  Widget _content(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_texts(index), _buttons(index)],
      ),
    );
  }

  Widget _texts(int index) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(index),
        _height(12),
        _description(index),
      ],
    ));
  }

  Widget _buttons(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _edit_Button(index),
        _delete_Button(index),

      ],
    );
  }

  Widget _delete_Button(int index) {
    return InkWell(
      onTap: () => controller.deleteTask(index),
      child: const Icon(
        Icons.delete,
        size: 35,
        color: Colors.black38
        ,
      ),
    );
  }

  Widget _edit_Button(int index) {
    return InkWell(
      onTap: () => controller.editTask(index),
      child: const Icon(
        Icons.edit,
        size:35,
        color: Colors.deepPurple,
      ),
    );
  }


  Widget _title(int index) {
    return Text(
      TodoData.data[index].title,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }

  Widget _description(int index) {
    return Text(
      TodoData.data[index].description,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _height(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _empty() {
    return const Center(
      child: Text(
        'List is empty ..',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
      ),
    );
  }
}
