import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/auth/login/service/login_service.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

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
  String? email;
  String? password;
  doLogin() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    showLoading();
    final result = await LoginService().login(
      email: email!,
      password: password!,
    );

    hideLoading();
    if (result) {
      final snackBar = SnackBar(
        content: Text('Success Login'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Get.offAll(MainNavigationView());
    } else {
      await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warnng'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Your email or password wrong'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
              ),
            ],
          );
        },
      );
    }
  }
}
