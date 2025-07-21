import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/freight_screens/yourfreight_trip_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

class FinddriverFreightScreen extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final String freightDetails;
  final String vehicleSize;

  const FinddriverFreightScreen({
    super.key,
    required this.fromLocation,
    required this.toLocation,
    required this.freightDetails,
    required this.vehicleSize,
  });

  List<Map<String, dynamic>> get drivers => [
    {
      'name': 'Ganesh Transport',
      'price': '₹850',
      'rating': 4.6,
      'time': '2 min',
      'distance': '1.2 km',
      'vehicle': 'Truck',
    },
    {
      'name': 'Logistics Pro',
      'price': '₹780',
      'rating': 4.8,
      'time': '3 min',
      'distance': '800 m',
      'vehicle': 'Mini Truck',
    },
    {
      'name': 'Heavy Haul',
      'price': '₹950',
      'rating': 4.5,
      'time': '7 min',
      'distance': '1.5 km',
      'vehicle': 'Truck',
    },
  ];

  void _showCancelDialog() {
    Get.defaultDialog(
      title: "Cancel Request?",
      middleText: "Are you sure you want to cancel?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(closeOverlays: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Drivers", style: TextStyle(color: Colors.white,fontSize: 18)),
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: _showCancelDialog,
        ),
        actions: [
          TextButton(
            onPressed: _showCancelDialog,
            child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Info Card
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
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
                    Row(children: [
                      const Icon(Icons.circle, size: 10, color: AppColors.skyBlue),
                      const SizedBox(width: 10),
                      Expanded(child: Text("From: $fromLocation")),
                    ]),
                    const SizedBox(height: 8),
                    Row(children: [
                      const Icon(Icons.circle, size: 10, color: AppColors.red),
                      const SizedBox(width: 10),
                      Expanded(child: Text("To: $toLocation")),
                    ]),
                    const SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.graybg.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Row(children: [
                          SizedBox(width: 10,),
                        const Text("🚚", style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Text("$freightDetails . $vehicleSize",style: TextStyle(color:AppColors.gray ),),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Drivers List
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(driver['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(driver['rating'].toString(), style: const TextStyle(fontSize: 13)),
                                      const SizedBox(width: 8),
                                      const Text("•", style: TextStyle(fontSize: 13)),
                                      const SizedBox(width: 8),
                                      Text(driver['vehicle'], style: const TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(driver['price'], style: TextStyle(color: AppColors.skyBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(driver['time'], style: const TextStyle(fontSize: 12)),
                                Text(driver['distance'], style: const TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Get.snackbar("Declined", "You declined ${driver['name']}"),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Decline", style: TextStyle(color: Colors.red)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                 Get.to(() => const YourfreightTripScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.skyBlue,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: const Text("Accept", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),

              // Info Note
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.skyBlue.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.info_outline, color: Colors.blue, size: 18),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Goods will be loaded securely",
                              style: TextStyle(
                                  color: AppColors.skyBlue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14)),
                          SizedBox(height: 2),
                          Text("Driver will verify contents before pickup",
                              style: TextStyle(color: Colors.blue, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
