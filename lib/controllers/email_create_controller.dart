import 'package:appflutter/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailCreateController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final error = Rx<String?>(null);
  final isLoading = RxBool(false);

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'This is a required field';
    if (value.length < 6) return 'Password should be at least 6 letters';

    if (passwordController.value != repeatPasswordController.value) {
      return 'Password do not match';
    }
    return null;
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      error.value = null;
      await _authRepository.createUserWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }
}
