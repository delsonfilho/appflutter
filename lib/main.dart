import 'package:appflutter/app.dart';
import 'package:appflutter/repository/auth_repository.dart';
import 'package:appflutter/repository/implementations/auth_repository.dart';
import 'package:appflutter/repository/implementations/my_user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put<AuthRepository>(AuthRepositoryImp());
  Get.put<MyUserRepositoryImp>(MyUserRepositoryImp());

  runApp(MyApp());
}
