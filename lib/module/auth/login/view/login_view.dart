import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: EdgeInsets.fromLTRB(
                    16, MediaQuery.of(context).size.height / 4, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Form Login",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    QTextField(
                      label: 'Email',
                      validator: Validator.email,
                      onChanged: (value) {
                        controller.email = value;
                      },
                      suffixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QTextField(
                      label: 'Password',
                      validator: Validator.required,
                      onChanged: (value) {
                        controller.password = value;
                      },
                      suffixIcon: Icons.visibility,
                    ),
                    InkWell(
                      onTap: () => Get.to(RegisterView()),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    QButton(
                      label: "Login",
                      onPressed: () => controller.doLogin(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
