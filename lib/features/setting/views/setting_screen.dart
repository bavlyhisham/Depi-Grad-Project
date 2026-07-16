import 'package:depi/core/cash/cache_helper.dart';
import 'package:depi/core/utils/app_colors.dart';
import 'package:depi/features/auth/presentation/views/sign_in_view.dart';
// استيراد صفحة الـ Layout الرئيسية لمشروعكم

import 'package:depi/features/layout/views/shop_layout.dart';

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  String _userName = "Ghofran Sabry"; 

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final bool? cachedNotif = CacheHelper.getData(key: 'notifications_enabled') as bool?;
    if (cachedNotif != null) {
      setState(() {
        _notificationsEnabled = cachedNotif;
      });
    }
  }

  // الدالة المسؤولة عن تسجيل الخروج الفعلي والانتقال لصفحة الـ SignIn
  Future<void> _logout(BuildContext context) async {
    await CacheHelper.removeData(key: 'token');
    await CacheHelper.saveData(
      key: 'isLoggedIn',
      value: false,
    );

    if (!mounted) return;

    // توجيه المستخدم لصفحة الـ SignIn وحذف كل الصفحات السابقة من الـ Stack
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
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        // 1. إلغاء سهم الرجوع التلقائي الافتراضي
        automaticallyImplyLeading: false, 
        // 2. إضافة سهم مخصص يوجه المستخدم لصفحة الـ ShopLayout مباشرة
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Shoplayout(),
              ),
              (route) => false,
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: [
          _buildSectionHeader("Account & Security"),
          _buildSettingTile(
            icon: Icons.person_outline,
            title: "Edit Profile",
            subtitle: "Name: $_userName", 
            onTap: () => _showEditProfileSheet(context),
          ),
          _buildSettingTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update and secure your password",
            onTap: () => _showChangePasswordDialog(context),
          ),
          
          const Divider(height: 30),

          _buildSectionHeader("Preferences"),
          
          Card(
            elevation: 0.5,
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              secondary: Icon(Icons.notifications_none, color: AppColors.primaryColor),
              title: const Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: const Text(
                "Manage your alerts and sounds",
                style: TextStyle(fontSize: 13),
              ),
              activeColor: AppColors.primaryColor,
              value: _notificationsEnabled,
              onChanged: (bool value) async {
                setState(() {
                  _notificationsEnabled = value;
                });
                await CacheHelper.saveData(key: 'notifications_enabled', value: value);
                
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value ? "Notifications turned ON" : "Notifications turned OFF"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),

          const Divider(height: 30),

          _buildSectionHeader("Support"),
          _buildSettingTile(
            icon: Icons.help_outline,
            title: "FAQ & Help",
            subtitle: "Get support and read our guides",
            onTap: () {
              _showSimpleAlert(
                context, 
                title: "FAQ & Support", 
                message: "For support, contact us at:\nsupport@depi-ecommerce.com"
              );
            },
          ),
          _buildSettingTile(
            icon: Icons.info_outline,
            title: "About App",
            subtitle: "Version 1.0.0",
            onTap: () {
              _showSimpleAlert(
                context, 
                title: "About App", 
                message: "DEPI Graduation Project\nFlutter E-Commerce App v1.0.0\nDeveloped with ❤️ by our awesome team."
              );
            },
          ),

          const SizedBox(height: 40),

          // زر تسجيل الخروج الفعلي
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => _showLogoutDialog(context),
              icon: const Icon(Icons.logout),
              label: const Text(
                "Logout",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade700,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showEditProfileSheet(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: _userName);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, 
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Edit Profile Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.trim().isNotEmpty) {
                    setState(() {
                      _userName = nameController.text.trim();
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Name updated successfully!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("Save"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Change Password"),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Enter new password",
              hintText: "At least 6 characters",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text.length >= 6) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password updated successfully!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password must be at least 6 characters!")),
                  );
                }
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _showSimpleAlert(BuildContext context, {required String title, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _logout(context);
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}