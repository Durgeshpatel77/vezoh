import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  // Ride
  final rideFromController = TextEditingController();
  final rideToController = TextEditingController();
  final isRideButtonEnabled = false.obs;

  // Courier
  final courierFromController = TextEditingController();
  final courierToController = TextEditingController();
  final courierDescController = TextEditingController();
  final isCourierButtonEnabled = false.obs;

  // Freight
  final freightFromController = TextEditingController();
  final freightToController = TextEditingController();
  final freightDescController = TextEditingController();
  final isFreightButtonEnabled = false.obs;

  // Freight vehicle size
  final selectedVehicleSize = ''.obs;

  final List<String> vehicleSizes = [
    'Mini vehicle',
    'Small vehicle',
    'Medium vehicle',
    'Large vehicle',
    'Extra Large vehicle',
  ];

  @override
  void onInit() {
    super.onInit();

    // Default vehicle size selection
    selectedVehicleSize.value = 'Mini vehicle';

    // Ride listeners
    rideFromController.addListener(_updateRideButtonState);
    rideToController.addListener(_updateRideButtonState);

    // Courier listeners
    courierFromController.addListener(_updateCourierButtonState);
    courierToController.addListener(_updateCourierButtonState);
    courierDescController.addListener(_updateCourierButtonState);

    // Freight listeners
    freightFromController.addListener(_updateFreightButtonState);
    freightToController.addListener(_updateFreightButtonState);
    freightDescController.addListener(_updateFreightButtonState);

    // Vehicle size change listener
    ever(selectedVehicleSize, (_) => _updateFreightButtonState());
  }

  void _updateRideButtonState() {
    isRideButtonEnabled.value =
        rideFromController.text.trim().isNotEmpty &&
            rideToController.text.trim().isNotEmpty;
  }

  void _updateCourierButtonState() {
    isCourierButtonEnabled.value =
        courierFromController.text.trim().isNotEmpty &&
            courierToController.text.trim().isNotEmpty &&
            courierDescController.text.trim().isNotEmpty;
  }

  void _updateFreightButtonState() {
    isFreightButtonEnabled.value =
        freightFromController.text.trim().isNotEmpty &&
            freightToController.text.trim().isNotEmpty &&
            freightDescController.text.trim().isNotEmpty &&
            selectedVehicleSize.value.isNotEmpty;
  }

  @override
  void onClose() {
    rideFromController.dispose();
    rideToController.dispose();
    courierFromController.dispose();
    courierToController.dispose();
    courierDescController.dispose();
    freightFromController.dispose();
    freightToController.dispose();
    freightDescController.dispose();
    super.onClose();
  }
}
