import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/courier_screens/delivery_complete_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

class YourcourierTripScreen extends StatefulWidget {
  const YourcourierTripScreen({super.key});

  @override
  State<YourcourierTripScreen> createState() => _YourcourierTripScreenState();
}

class _YourcourierTripScreenState extends State<YourcourierTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
        elevation: 0,
        title: Text(
          "Your delivery",
          style: TextStyle(color: AppColors.white, fontSize: 18),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Map View Placeholder
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Map view",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const SizedBox(height: 16),

            // Driver Status Section
            InkWell(
              onTap: () {
                Get.to(() => DeliveryCompleteScreen());

              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.gray, width: 0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Driver coming for pickup",
                      style: TextStyle(fontSize: 16, color: AppColors.black),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Arriving in 3 minutes",
                      style: TextStyle(fontSize: 13, color: AppColors.gray),
                    ),

                    const SizedBox(height: 12),
                    // Progress Bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: buildProgressBar(
                        progress: 0.5,
                      ), // 0.0, 0.5, 1.0 depending on status
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Driver Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray, width: 0.2),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue.shade100,
                    child: const Text(
                      "VB",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Vikram Bike",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "⭐ 4.8   • Bike",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 2),
                        Text("KA-04-GH-3456", style: TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.4,color: AppColors.gray,),
                          color: Colors.transparent,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.call_outlined,size: 20,),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.4,color: AppColors.gray,),
                          color: Colors.transparent,
                        ),

                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.comment,size: 20,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // From / To Info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray, width: 0.2),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.blue, size: 10),
                      const SizedBox(width: 10),
                      const Text("Block A", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.red, size: 10),
                      const SizedBox(width: 10),
                      const Text("Block B", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.gray, width: 0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Package information",style: TextStyle(color: AppColors.black,fontSize: 16),),
                  const SizedBox(height: 8),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.graybg.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text("📦"),
                        SizedBox(width: 10),
                        Expanded(child: Text("Laddus")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Cancel Trip Button
            OutlinedButton(
              onPressed: () {

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Cancel delivery",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for status steps
  Widget buildProgressBar({required double progress}) {
    return Column(
      children: [
        // Progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress, // 0.0 to 1.0
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
        const SizedBox(height: 10),

        // Steps
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Driver assigned",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text(
              "On the way",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text(
              "Arrived",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
