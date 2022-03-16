import 'package:appflutter/repository/auth_repository.dart';
import 'package:get/get.dart';

class HomeSignInController extends GetxController {
  final _authRepository = Get.find<AuthRepository>();

  final error = Rx<String?>(null);

  final isLoading = RxBool(false);

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      isLoading.value = true;
      error.value = null;
      await auxUser;
    } catch (e) {
      error.value = e.toString();
    }
    isLoading.value = false;
  }

  Future<void> signInAnonymously() => _authRepository.signInAnonymously();
  Future<void> signInWithGoogle() => _authRepository.signInWithGoogle();
  Future<void> signInWithFacebook() => _authRepository.signInWithFacebook();
}
