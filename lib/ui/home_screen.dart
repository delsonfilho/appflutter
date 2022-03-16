import 'package:appflutter/controllers/auth_controller.dart';
import 'package:appflutter/controllers/my_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(MyUserController());

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), actions: [
        IconButton(
            onPressed: () => Get.find<AuthController>().signedOut(),
            icon: const Icon(Icons.logout))
      ]),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return _MyUserSection();
      }),
    );
  }
}

class _MyUserSection extends StatelessWidget {
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<MyUserController>();

    
  }
}
