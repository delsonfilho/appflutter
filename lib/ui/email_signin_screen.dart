import 'package:appflutter/controllers/email_signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  EmailSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Get.put(EmailSignController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Email'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Visibility(
                      visible: emailController.isLoading.value,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ))),
                  Obx(() => Visibility(
                      visible: emailController.error.value?.isNotEmpty ?? true,
                      child: Text(emailController.error.value ?? '',
                          style: const TextStyle(
                              color: Colors.red, fontSize: 24)))),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: emailController.emptyValidator,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: emailController.emptyValidator,
                  ),
                  Center(
                      child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        emailController.signInWithEmailAndPassword();
                      }
                    },
                  ))
                ],
              ))),
    );
  }
}
