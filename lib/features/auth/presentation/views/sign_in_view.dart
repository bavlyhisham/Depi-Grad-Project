import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
// التعديل هنا: استيراد ملف الـ CacheHelper (تأكدي من صحة المسار حسب مشروعك)
import '../../../../core/cash/cache_helper.dart'; 
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../widgets/custom_text_field.dart';
import 'sign_up_view.dart';
import 'package:depi/features/auth/presentation/views/home_view.dart';
import 'forgot_password_view.dart'; 

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordHidden = true; 

  @override
  void dispose() {
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
            // التعديل هنا: حفظ حالة تسجيل الدخول في الكاش قبل الانتقال للهوم
            // لو الـ state بترجع token تقدري تحفظيه كقيمة String، هنا هنحفظ قيمة bool مؤقتاً
            CacheHelper.saveData(key: 'isLoggedIn', value: true);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Success! Token Saved.')),
            );
            
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.errMessage}')),
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
                  const SizedBox(height: 60),
                  
                  Center(
                    child: Image.asset(
                      'assets/images/Borcelle.png',
                      height: 200, 
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('E-COMMERCE', style: TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold));
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome Back To Borcelle', 
                    style: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Please sign in with your mail', 
                    style: TextStyle(color: AppColors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Email / User Name', 
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'enter your name or email', 
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Password', 
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  
                  CustomTextField(
                    hintText: 'enter your password', 
                    controller: passwordController,
                    isPassword: isPasswordHidden, 
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: AppColors.primaryColor, 
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordView()),
                        );
                      },
                      child: const Text(
                        'Forgot password', 
                        style: TextStyle(
                          color: AppColors.white,
                          decoration: TextDecoration.underline, 
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: state is AuthLoading 
                          ? null 
                          : () {
                              BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                      child: state is AuthLoading 
                          ? const CircularProgressIndicator(color: AppColors.primaryColor)
                          : const Text(
                              'Login', 
                              style: TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                      },
                      child: const Text(
                        "Don't have an account? Create Account", 
                        style: TextStyle(color: AppColors.white),
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