import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezoh/screens/home_screens/rides_screens/your_trip_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

// Dummy next page
class DriverConfirmationPage extends StatelessWidget {
  final String driverName;

  const DriverConfirmationPage({super.key, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation", style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.skyBlue,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: Center(
        child: Text(
          "You accepted the ride with $driverName",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Main screen
class AvailableDriversScreen extends StatelessWidget {
  final String fromLocation;
  final String toLocation;

  const AvailableDriversScreen({
    super.key,
    required this.fromLocation,
    required this.toLocation,
  });

  List<Map<String, dynamic>> get drivers => [
    {
      'name': 'Rajesh Kumar',
      'price': '₹145',
      'rating': 4.9,
      'time': '2 min',
      'distance': '300 m',
      'image': 'assets/driver.png',
    },
    {
      'name': 'Suresh Patel',
      'price': '₹138',
      'rating': 4.8,
      'time': '3 min',
      'distance': '400 m',
      'image': 'assets/driver.png',
    },
    {
      'name': 'Amit Singh',
      'price': '₹152',
      'rating': 4.7,
      'time': '4 min',
      'distance': '500 m',
      'image': 'assets/driver.png',
    },
  ];

  void _showCancelDialog() {
    Get.defaultDialog(
      title: "Cancel Ride?",
      middleText: "Are you sure you want to cancel?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(closeOverlays: true),
    );
  }

  void _navigateToNextPage(String driverName) {
    Get.to(() => DriverConfirmationPage(driverName: driverName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Available Drivers", style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: _showCancelDialog,
        ),
        actions: [
          TextButton(
            onPressed: _showCancelDialog,
            child: const Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // From - To Info
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1, color: AppColors.gray),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: AppColors.skyBlue),
                        SizedBox(width: 10),
                        Text(fromLocation,
                            style: TextStyle(fontSize: 14, color: AppColors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: AppColors.red),
                        SizedBox(width: 10),
                        Text(toLocation,
                            style: TextStyle(fontSize: 14, color: AppColors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Driver List
              ...drivers.map((driver) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.1, color: AppColors.gray),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Driver Info Row
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.skyBlue,
                              child: Text(
                                driver['name']
                                    .toString()
                                    .split(" ")
                                    .map((e) => e[0])
                                    .take(2)
                                    .join(),
                                style: const TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(driver['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,
                                          size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(driver['rating'].toString(),
                                          style: const TextStyle(fontSize: 13)),
                                      const SizedBox(width: 8),
                                      const Text("•", style: TextStyle(fontSize: 13)),
                                      const SizedBox(width: 8),
                                      const Text("Auto", style: TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(driver['price'],
                                    style: TextStyle(
                                        color: AppColors.skyBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(driver['time'],
                                    style: const TextStyle(fontSize: 12)),
                                Text(driver['distance'],
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Get.snackbar("Declined", "You declined ${driver['name']}");
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Decline",
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child:
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => YourTripScreen(
                                    driverName: driver['name'],
                                    fromLocation: fromLocation,
                                    toLocation: toLocation,
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.skyBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text("Accept", style: TextStyle(color: AppColors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
