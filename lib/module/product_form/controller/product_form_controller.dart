import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/product_service.dart';

class ProductFormController extends State<ProductFormView> {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    if (isEditMode) {
      name = widget.item!["name"];
      description = widget.item!["description"];
      image_url = widget.item!["image_url"];
      double priceDouble =
          double.parse(widget.item!["price"]); // Konversi string ke double
      int priceInt = priceDouble.toInt();
      price = priceInt;
      category_id = widget.item!["category_id"];
    }
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? name;
  String? description;
  String? image_url;
  int? price;
  int? category_id;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isEditMode => widget.item != null;

  doSave() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    showLoading();
    if (isEditMode) {
      final result = await ProductService().update(
        id: widget.item!["id"],
        name: name!,
        description: description!,
        price: price!,
        image_url: image_url!,
        category_id: category_id!,
      );
      hideLoading();
      final snackBar = SnackBar(
        content: Text('Sucess update'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final result = await ProductService().create(
        name: name!,
        description: description!,
        price: price!,
        image_url: image_url!,
        category_id: category_id!,
      );
      hideLoading();
      final snackBar = SnackBar(
        content: Text('${result["data"]["name"]} Sucess'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Get.back();
  }
}
