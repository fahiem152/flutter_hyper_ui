import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        actions: const [],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(12.0),
            margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
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
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Form Register",
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
                    label: 'Full Name',
                    onChanged: (value) {
                      controller.fullName = value;
                    },
                    suffixIcon: Icons.account_circle,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  QTextField(
                    label: 'Email',
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
                    onChanged: (value) {
                      controller.password = value;
                    },
                    suffixIcon: Icons.visibility,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Spacer(),
                  QButton(
                      label: "Register",
                      onPressed: () => controller.doRegister())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
