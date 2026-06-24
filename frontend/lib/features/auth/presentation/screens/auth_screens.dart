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
            child: Container(
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
                  //if (controller.isLogin)              
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Get started for free today',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 20,),
                  AuthOption(),
                  const SizedBox(height: 20,),
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
                    controller: controller.emailController
                  ),
                  const SizedBox(height: 20,),
                  CustomForm(
                    tag: 'Password', 
                    hint:  '********',
                    prefixIcon: Icon(Icons.lock_outline),
                    controller: controller.passwordController
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Checkbox(
                        value: false,               
                        onChanged: (value) {
                          //
                        },
                      ),
                      Expanded(
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
                        'Create Account',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ),
                  ), 
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?'
                      ),
                      TextButton(
                        onPressed: () {}, 
                        child: Text(
                          'Log In'
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}