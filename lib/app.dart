import 'package:appflutter/controllers/auth_controller.dart';
import 'package:appflutter/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: authController,
        builder: (_) {
          return const GetMaterialApp(
            title: 'Authentication Flow',
            onGenerateRoute: Routes.routes,
          );
        });
  }

  // This widget is the root of your application.

}
