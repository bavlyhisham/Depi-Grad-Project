import 'package:depi/core/cash/cache_helper.dart';
import 'package:depi/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> logout(BuildContext context) async {
    // حذف التوكن
    await CacheHelper.removeData(key: 'token');

    await CacheHelper.saveData(
      key: 'isLoggedIn',
      value: false,
    );
    

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInView(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => logout(context),
          icon: const Icon(Icons.logout),
          label: const Text("Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 56, 39, 189),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
          ),
        ),
      ),
    );
  }
}