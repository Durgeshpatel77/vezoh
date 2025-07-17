import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezoh/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: AppColors.white)),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gray, width: 0.3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.graybg,
                    child: const Icon(Icons.person, size: 40, color: AppColors.gray),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "John Doe",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "+91 98765 43210",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.graybg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Verified",
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Options List
            _buildProfileOption(Icons.access_time_outlined, "Your Trips & Deliveries"),
            _buildProfileOption(Icons.payment, "Payment Methods"),
            _buildProfileOption(Icons.translate, "Language"),
            _buildProfileOption(Icons.settings, "Settings"),
            _buildProfileOption(Icons.help_outline, "Help"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(width: 0.3,color: AppColors.gray),borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: AppColors.black),
              title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                // TODO: Add navigation logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
