import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vezoh/controller/user_side_controllers/home_controller/home_page_controller.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/courier_screens/finddriver_courier_screen.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/freight_screens/finddriver_freight_screen.dart';
import 'package:vezoh/screens/user_sides_screens/home_screens/rides_screens/profile_screen.dart';
import 'package:vezoh/theme/app_theme.dart';

// Import screen
import 'package:vezoh/widgets/card_wrapper.dart';
import 'package:vezoh/widgets/from_to_fields.dart';
import 'rides_screens/available_drivers_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());

  final List<Map<String, dynamic>> tabs = [
    {'icon': Icons.directions_bus, 'label': 'Ride'},
    {'icon': Icons.local_shipping_outlined, 'label': 'Courier'},
    {'icon': Icons.fire_truck, 'label': 'Freight'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.graybg,
      drawer: const Drawer(child: Center(child: Text('Drawer Menu'))),
      appBar: AppBar(
        title: const Text('Vezoh'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.to(() => const ProfileScreen()),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(color: AppColors.cyan),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: _buildCustomTabBar(),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.skyBlue,
                                child: const Icon(Icons.location_on, size: 30, color: AppColors.white),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "DB Mall Square",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Obx(() => _buildBottomCard()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCard() {
    switch (controller.selectedIndex.value) {
      case 0:
        return RideBottomCard(controller: controller);
      case 1:
        return CourierBottomCard(controller: controller);
      case 2:
        return FreightBottomCard(controller: controller);
      default:
        return const SizedBox();
    }
  }

  Widget _buildCustomTabBar() {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.3, color: AppColors.gray),
      ),
      child: Obx(
            () => Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = controller.selectedIndex.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedIndex.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.skyBlue : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        tabs[index]['icon'],
                        size: 18,
                        color: isSelected ? AppColors.white : AppColors.gray,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        tabs[index]['label'],
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? AppColors.white : AppColors.gray,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
Widget findDriverButton(HomeController controller) {
  return Obx(() {
    bool isEnabled = false;

    // Determine the correct observable based on selected tab
    switch (controller.selectedIndex.value) {
      case 0:
        isEnabled = controller.isRideButtonEnabled.value;
        break;
      case 1:
        isEnabled = controller.isCourierButtonEnabled.value;
        break;
      case 2:
        isEnabled = controller.isFreightButtonEnabled.value;
        break;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEnabled ? AppColors.skyBlue : AppColors.skylite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: isEnabled
            ? () {
          final index = controller.selectedIndex.value;

          if (index == 0) {
            // Ride
            final from = controller.rideFromController.text.trim();
            final to = controller.rideToController.text.trim();
            Get.to(() => AvailableDriversScreen(fromLocation: from, toLocation: to));
          } else if (index == 1) {
            // Courier
            final from = controller.courierFromController.text.trim();
            final to = controller.courierToController.text.trim();
            final desc = controller.courierDescController.text.trim();

            Get.to(() => FindDriverForCourierScreen(
              fromLocation: from,
              toLocation: to,
              description: desc,
            ));
          }
          else if (index == 2) {
            final from = controller.freightFromController.text.trim();
            final to = controller.freightToController.text.trim();
            final details = controller.freightDescController.text.trim();
            final vehicleSize = controller.selectedVehicleSize.value;

            Get.to(() => FinddriverFreightScreen(
              fromLocation: from,
              toLocation: to,
              freightDetails: details,
              vehicleSize: vehicleSize,
            ));
          }
        }
            : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text("Find drivers", style: TextStyle(color: AppColors.white)),
      ),
    );
  });
}
//ride bottom card
class RideBottomCard extends StatelessWidget {
  final HomeController controller;
  const RideBottomCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      title: "Choose your destination",
      subtitle: "Choose your destination",
      children: [
        fromToFields(
          fromController: controller.rideFromController,
          toController: controller.rideToController,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            // Handle offer tap
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.skyBlue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("💰", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  "Offer your fare",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.skyBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // 🔽 Updated to handle navigation
        Obx(() => ElevatedButton(
          onPressed: controller.isRideButtonEnabled.value
              ? () {
            final from = controller.rideFromController.text.trim();
            final to = controller.rideToController.text.trim();
            Get.to(() => AvailableDriversScreen(
              fromLocation: from,
              toLocation: to,
            ));
          }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: AppColors.skyBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBackgroundColor: AppColors.skylite,
          ),
          child: const Center(
            child: Text(
              "Find Driver",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        )),
      ],
    );
  }
}

//Courier Bottom Card
class CourierBottomCard extends StatelessWidget {
  final HomeController controller;
  const CourierBottomCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      title: "Send your package",
      subtitle: "Quick delivery for your package",
      children: [
        fromToFields(
          fromController: controller.courierFromController,
          toController: controller.courierToController,
        ),
        const SizedBox(height: 20),
        const Text("Package details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        TextField(
          controller: controller.courierDescController,
          maxLines: 2,
          maxLength: 100,

          decoration: InputDecoration(
            counterText: '',
            hintText: "Describe the package (weight, size, contents)",
             filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 20),
        findDriverButton(controller),
      ],
    );
  }
}

//Freight Bottom Card
class FreightBottomCard extends StatelessWidget {
  final HomeController controller;
  const FreightBottomCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      title: "Transport your goods",
      subtitle: "Heavy goods transport solution",
      children: [
        fromToFields(
          fromController: controller.freightFromController,
          toController: controller.freightToController,
        ),
        const SizedBox(height: 20),

        const Text("Freight details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),

        TextField(
          controller: controller.freightDescController,
          maxLines: 1,
          maxLength: 30,
          decoration: InputDecoration(
            counterText: '',
            hintText: "Chocolates carton",
            hintStyle: TextStyle(color: AppColors.black),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),

        const SizedBox(height: 16),

        const Text("Vehicle size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),

        Obx(() => DropdownButtonFormField<String>(
          value: controller.selectedVehicleSize.value.isNotEmpty
              ? controller.selectedVehicleSize.value
              : null,
          items: controller.vehicleSizes.map((size) {
            return DropdownMenuItem<String>(
              value: size,
              child: Text(size),
            );
          }).toList(),
          onChanged: (value) {
            controller.selectedVehicleSize.value = value!;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        )),

        const SizedBox(height: 20),

        findDriverButton(controller),
      ],
    );
  }
}
