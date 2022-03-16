import 'dart:io';

import 'package:appflutter/model/user.dart';
import 'package:appflutter/providers/firebase_provider.dart';
import 'package:appflutter/repository/my_user_repository.dart';

class MyUserRepositoryImp extends MyUserRepository {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
