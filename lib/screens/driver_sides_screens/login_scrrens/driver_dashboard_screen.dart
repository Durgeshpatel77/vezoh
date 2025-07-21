import 'package:flutter/material.dart';
import 'package:vezoh/screens/driver_sides_screens/login_scrrens/driver_dashboard_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

// Assuming AppColors is defined like this based on your code:

class VerificationSubmittedScreen extends StatefulWidget {
  const VerificationSubmittedScreen({super.key});

  @override
  State<VerificationSubmittedScreen> createState() =>
      _VerificationSubmittedScreenState();
}

class _VerificationSubmittedScreenState extends State<VerificationSubmittedScreen> {
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.graybg,
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Profile action
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // This empty container acts as a flexible space above the card
          // to push the card towards the bottom, while allowing the circle
          // to be positioned relative to the top of the card.
          Container(),

          // Bottom Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              // Adjust the height factor to control how much of the screen the card occupies
              // In the image, it looks like it takes up more than half.
              height: MediaQuery.of(context).size.height * 0.60, // Roughly 60% of screen height
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Status Section
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray, width: 0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: "You are" + switch
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You are",
                              style: TextStyle(color: AppColors.gray),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Go online",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 6),
                                Transform.scale(
                                  scale: 0.75,
                                  child: Switch(
                                    value: isOnline,
                                    activeColor: Colors.green,
                                    onChanged: (val) {
                                      setState(() {
                                        isOnline = val;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        // Online/Offline Status
                        Text(
                          isOnline ? "Online" : "Offline",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isOnline ? Colors.green : AppColors.gray,
                          ),
                        ),

                        const SizedBox(height: 10),

                        if (!isOnline) ...[
                          const Text(
                            "Go online to start receiving requests",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.gray.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Ride",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.gray.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "Courier",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ] else
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.green,
                                  size: 18,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Looking for requests across 2 services...",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Earnings & Trips
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoTile("₹1250", "Today's earnings"),
                      _infoTile("8", "Trips completed"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Vehicle Info Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.skyBlue,
                          child: const Icon(
                            Icons.local_taxi,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Auto",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("JH098212"),
                              Text(
                                "ride · courier",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Active",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // View Earnings Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // View earnings logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.skyBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "View earnings",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Floating Circle Icon - positioned above the card
          // Using a FractionalOffset to place it relative to the bottom card's top edge
          Positioned(
            top: MediaQuery.of(context).size.height * 0.60 - 25, // Card top - half of circle radius
            left: MediaQuery.of(context).size.width / 2 - 25, // Center horizontally
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green, // Changed to green
              child: Icon(Icons.check, color: Colors.white), // Changed to check icon
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
