import 'package:flutter/material.dart';
import 'package:vezoh/theme/app_theme.dart';

class RateTripScreen extends StatefulWidget {
  const RateTripScreen({super.key});

  @override
  State<RateTripScreen> createState() => _RateTripScreenState();
}

class _RateTripScreenState extends State<RateTripScreen> {
  int selectedRating = 0;
  final Set<String> selectedTags = {};

  final List<String> tags = [
    "Clean vehicle",
    "On time",
    "Safe driving",
    "Friendly",
  ];

  void toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Rate your trip", style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.skyBlue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Driver info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray, width: 0.3),
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 28,
                    child: Text("RK", style: TextStyle(fontSize: 18, color: AppColors.white)),
                    backgroundColor: AppColors.skyBlue,
                  ),
                  SizedBox(height: 8),
                  Text("Rajesh Kumar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  Text("How was your trip?", style: TextStyle(color: AppColors.gray)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ⭐ Interactive Rating
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray, width: 0.3),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) => IconButton(
                        onPressed: () {
                          setState(() {
                            selectedRating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < selectedRating ? Icons.star : Icons.star_border,
                          color: index < selectedRating ? Colors.amber : AppColors.gray,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  const Text("Tap to rate", style: TextStyle(color: AppColors.gray)),
                  const SizedBox(height: 20),

                  // 🏷️ Tags
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: tags.map((tag) {
                      final isSelected = selectedTags.contains(tag);
                      return GestureDetector(
                        onTap: () => toggleTag(tag),
                        child: SizedBox(
                          width: (MediaQuery.of(context).size.width - 90) / 2, // 2 items with spacing
                          height: 45,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? AppColors.skyBlue : Colors.grey.shade300,
                              ),
                              color: isSelected ? AppColors.skyBlue.withOpacity(0.1) : Colors.white,
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? AppColors.skyBlue : AppColors.black,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                ],
              ),
            ),

SizedBox(height: 50,),

            // 🔘 Submit / Skip
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Do something with selectedRating & selectedTags
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.skyBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Submit rating",style: TextStyle(color:AppColors.white,fontSize: 16 ),),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray, width: 0.3),
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
