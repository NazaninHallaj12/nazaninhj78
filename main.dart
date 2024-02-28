import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled17/pages/add_todo/binding/add_todo_binding.dart';
import 'package:untitled17/pages/add_todo/view/add_todo_view.dart';
import 'package:untitled17/pages/home/binding/home_binding.dart';
import 'package:untitled17/pages/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeApp.homeRoute,
      getPages: [
        GetPage(
            name: HomeApp.homeRoute,
            page: () => const HomeApp(),
            binding: HomeBinding(),
            children: [
              GetPage(
                  name: AddTodo.addTodoRoute,
                  page: () => const AddTodo(),
                  binding: AddTodoBinding())
            ])
      ],
    );
  }
}
