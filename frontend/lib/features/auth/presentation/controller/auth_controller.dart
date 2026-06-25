import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLogin = true.obs;
  final acceptTerms = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeAuthMode() {
    isLogin.toggle();
  }
}