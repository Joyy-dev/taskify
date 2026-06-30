import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/auth/presentation/controller/auth_controller.dart';
import 'package:taskify/features/auth/presentation/widget/auth_option.dart';
import 'package:taskify/shared/widgets/custom_form.dart';

class AuthScreens extends StatelessWidget {
  const AuthScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Obx(() {
              final login = controller.isLogin.value;
              return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.outline,
                    blurRadius: 15
                  )
                ]
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/taskify.png',
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    login ? 'Welcome back' : 'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    login ? 'Sign in to your Taskify account to continue your work' : 'Get started for free today',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  AuthOption(),
                  const SizedBox(height: 20,),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        if(!login)
                        CustomForm(
                          tag: 'Full Name', 
                          hint: 'John Doe',
                          prefixIcon: Icon(Icons.person),
                        controller: controller.nameController
                      ),
                      const SizedBox(height: 20,),
                      CustomForm(
                        tag: 'Email Address',
                        hint: 'john@taskify.com', 
                        prefixIcon: Icon(Icons.email_outlined),
                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'An Email Address is required';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Invalid credential';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      CustomForm(
                        tag: 'Password', 
                        hint:  '********',
                        prefixIcon: Icon(Icons.lock_outline),
                        icon: IconButton(
                          onPressed: controller.toggleIcon, 
                          icon: controller.obscurePassword.value ? Icon(Icons.visibility_off_outlined) : Icon(Icons.visibility_outlined)
                        ),
                        tagButton: () {
                          //
                        },
                        obscureText: controller.obscurePassword.value,
                        actionText: login ? 'Forget Password?' : '',
                        line: 1,
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be atleast 8 character';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),  
                      Row(
                        children: [
                          Checkbox(
                            value: controller.acceptTerms.value,               
                            onChanged: (value) {
                              controller.acceptTerms.value = value ?? false;
                            },
                          ),
                          login ? Text('Keep me signed in') : Expanded(
                            child: RichText(
                              text: TextSpan(
                              text: 'I agree to the ',
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(
                                    text: 'Terms of Services ',
                                    style: Theme.of(context).textTheme.headlineSmall
                                  ),
                                  TextSpan(
                                    text: 'and ',
                                    style: Theme.of(context).textTheme.bodySmall
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: Theme.of(context).textTheme.headlineSmall
                                  )
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(            
                          onPressed: () {}, 
                          child: Text(
                            login ? 'Sign In' : 'Create Account',
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ),
                      ), 
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            login ? 'Doesn\'t have an account?' : 'Already have an account?'
                          ),
                          TextButton(
                            onPressed: controller.changeAuthMode, 
                            child: controller.isLoading.value ? CircularProgressIndicator() : Text(
                              login ? 'Create Account' : 'Log In'
                            )
                          )
                        ],
                      )
                      ],
                    )
                  ) 
                ],
              ),
            );
            })
            
            
          ),
        ),
      )
    );
  }
}