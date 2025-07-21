import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/freight_screens/rate_your_freighttrip_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

class TransportCompleteScreen extends StatefulWidget {
  const TransportCompleteScreen({super.key});

  @override
  State<TransportCompleteScreen> createState() => _TransportCompleteScreenState();
}

class _TransportCompleteScreenState extends State<TransportCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Transport complete", style: TextStyle(color: AppColors.white, fontSize: 18)),
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ✅ Trip Completed Info
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray,width: 0.3),

              ),
              child: Column(
                children:  [
                  CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.green.shade100,
                      child: Icon(Icons.check, color: Colors.green, size: 30)),
                  SizedBox(height: 12),
                  Text("Goods transported!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("your goods were transported securely ", style: TextStyle(fontSize: 14, color: AppColors.gray)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 📋 Trip Summary (Static)
            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray,width: 0.3),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Transport summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 12),
                  _tripDetailRow("Distance", "12.5 km"),
                  _tripDetailRow("Duration", "45 min"),
                  _tripDetailRow("Driver", "Ganesh Transport"),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total fare", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                      Text("₹850", style: TextStyle(color: AppColors.skyBlue, fontWeight: FontWeight.bold,fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 💳 Payment Methods (Styled like screenshot)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.gray,width: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment",style: TextStyle(color: AppColors.black,fontSize: 22),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      PaymentOption(emoji: "💵", label: "Cash"),
                      PaymentOption(emoji: "📱", label: "UPI"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 🔘 Confirm Payment Button
            Container(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const RateYourFreighttripScreen());

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.skyBlue,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child:  Text("Confirm payment",style: TextStyle(color: AppColors.white,fontSize: 16),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _tripDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style:  TextStyle(color: AppColors.black)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// 🔳 Payment Option UI Like Screenshot
class PaymentOption extends StatelessWidget {
  final String emoji;
  final String label;

  const PaymentOption({super.key, required this.emoji, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray,width: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

