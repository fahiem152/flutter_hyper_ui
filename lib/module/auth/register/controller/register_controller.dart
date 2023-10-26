import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/auth/register/service/register_service.dart';
import '../view/register_view.dart';

class RegisterController extends State<RegisterView> {
  static late RegisterController instance;
  late RegisterView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? fullName;
  String? email;
  String? password;

  doRegister() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    showLoading();
    final result = await RegisterService().register(
      fullName: fullName!,
      email: email!,
      password: password!,
    );
    hideLoading();
    final snackBar = SnackBar(
      content: Text('${result["data"]["name"]}'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Get.back();
  }
}
