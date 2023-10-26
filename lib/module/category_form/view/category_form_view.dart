
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/category_form_controller.dart';

class CategoryFormView extends StatefulWidget {
    const CategoryFormView({Key? key}) : super(key: key);

    Widget build(context, CategoryFormController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
        title: const Text("CategoryForm"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
            ),
        ),
        ),
    );
    }

    @override
    State<CategoryFormView> createState() => CategoryFormController();
}
    