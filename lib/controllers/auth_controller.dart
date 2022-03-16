import 'dart:async';

import 'package:appflutter/navigation/routes.dart';
import 'package:appflutter/repository/auth_repository.dart';
import 'package:get/get.dart';

enum AuthState {
  signedOut,
  signedIn,
}

class AuthController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();
  late StreamSubscription _authSubscription;

  final Rx<AuthState> authState = Rx(AuthState.signedOut);
  final Rx<AuthUser?> authUser = Rx(null);

  void _authStateChanged(AuthUser? user) {
    if (user == null) {
      authState.value = AuthState.signedOut;
      Get.offAllNamed(Routes.intro);
    } else {
      authState.value = AuthState.signedIn;
      Get.offAllNamed(Routes.home);
    }
    authUser.value = user;
  }

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));

    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
    super.onInit();
  }

  Future<void> signedOut() async {
    await _authRepository.signOut();
  }

  @override
  void onClose() {
    _authSubscription.cancel();
    super.onClose();
  }
}
