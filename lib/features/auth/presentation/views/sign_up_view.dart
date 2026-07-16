import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../widgets/custom_text_field.dart';

import 'sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account Created Successfully!')),
            );

            
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignInView()),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                 Center(
  child: Text(
    'STORE',
    style: TextStyle(
      color: AppColors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),
),

                  const SizedBox(height: 20),

                  const Text(
                    'Full Name',
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'enter your full name',
                    controller: nameController,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Mobile Number',
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'enter your mobile no.',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'E-mail address',
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'enter your email address',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Password',
                    style: TextStyle(color: AppColors.white),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: 'enter your password',
                    isPassword: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).register(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          phone: phoneController.text.trim(),
                        );
                      },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : const Text(
                              'Sign up',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}