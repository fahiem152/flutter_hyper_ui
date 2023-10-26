// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hyper_ui/core.dart';

import '../controller/product_form_controller.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                QImagePicker(
                  label: "Image",
                  onChanged: (value) {
                    controller.image_url = value;
                  },
                  value: controller.image_url,
                  validator: Validator.required,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                QTextField(
                    label: "Name",
                    value: controller.name,
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.name = value;
                    }),
                const SizedBox(
                  height: 4.0,
                ),
                QDropdownField(
                    value: controller.category_id,
                    validator: Validator.required,
                    label: "Category Product",
                    items: [
                      {
                        "label": "SmartPhone",
                        "value": 1,
                      },
                      {
                        "label": "Laptop",
                        "value": 2,
                      }
                    ],
                    onChanged: (value, label) {
                      controller.category_id = value;
                    }),
                QTextField(
                    validator: Validator.required,
                    value: controller.description,
                    label: "Description",
                    onChanged: (value) {
                      controller.description = value;
                    }),
                QNumberField(
                  validator: Validator.number,
                  value: controller.price.toString(),
                  label: "Price",
                  onChanged: (value) {
                    controller.price = int.parse(value);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                QButton(label: "Save", onPressed: () => controller.doSave()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
