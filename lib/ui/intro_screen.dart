import 'package:appflutter/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:page_indicator/page_indicator.dart';

import 'package:appflutter/controllers/home_signin_controller.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _IntroPager(),
    );
  }
}

class _IntroPager extends HookWidget {
  final String exampleText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  @override
  Widget build(BuildContext context) {
    final homeSignInController = Get.put(HomeSignInController());

    return AbsorbPointer(
      absorbing: homeSignInController.isLoading.value,
      child: PageIndicatorContainer(
        child: PageView(
          children: [
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_1.png',
            ),
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_2.png',
            ),
            _DescriptionPage(
              text: exampleText,
              imagePath: 'assets/intro_3.png',
            ),
            _LoginPage(),
          ],
          controller: usePageController(),
        ),
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 12,
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Colors.black,
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;
  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 200, height: 200),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold)),
          ))
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeSignInController = Get.find<HomeSignInController>();

    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/intro_1.png', width: 200, height: 200),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text('Sign in or create an account',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Obx(() => Visibility(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
              visible: homeSignInController.isLoading.value)),
          Obx(
            () => Visibility(
              visible: homeSignInController.error.value?.isNotEmpty ?? true,
              child: Text(
                homeSignInController.error.value ?? '',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                _LoginButton(
                    text: 'Sign in With Google',
                    imagePath: 'assets/icon_google.png',
                    color: Colors.white,
                    textColor: Colors.grey,
                    onTap: () => homeSignInController.signInWithGoogle()),
                const SizedBox(
                  height: 8,
                ),
                _LoginButton(
                    text: 'Sign in With Facebook',
                    imagePath: 'assets/icon_facebook.png',
                    color: Colors.blueAccent,
                    onTap: () => homeSignInController.signInWithFacebook()),
                const SizedBox(
                  height: 8,
                ),
                _LoginButton(
                  text: 'Sign in With Email',
                  imagePath: 'assets/icon_email.png',
                  color: Colors.red,
                  textColor: Colors.white,
                  onTap: () => Get.toNamed(Routes.signInEmail),
                ),
                const SizedBox(
                  height: 8,
                ),
                _LoginButton(
                    text: 'Sign in Anonymously',
                    imagePath: 'assets/icon_question.png',
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    onTap: () => homeSignInController.signInAnonymously()),
                const SizedBox(
                  height: 8,
                ),
                OutlinedButton(
                    child: const Text('Create account'),
                    onPressed: () => Get.toNamed(Routes.createAccount))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset(
                    imagePath,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))),
    );
  }
}
