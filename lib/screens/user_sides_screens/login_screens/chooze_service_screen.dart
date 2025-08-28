// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:vezoh/theme/app_theme.dart';
//
// import 'get_started_screen.dart';
//
//
// class ChoozeServiceScreen extends StatefulWidget {
//   const ChoozeServiceScreen({super.key});
//
//   @override
//   State<ChoozeServiceScreen> createState() => _ChoozeServiceScreenState();
// }
//
// class _ChoozeServiceScreenState extends State<ChoozeServiceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Header
//             Container(
//               color: AppColors.skyBlue,
//               padding: const EdgeInsets.symmetric(vertical: 24), // reduced from 40
//               child: const Column(
//                 children: [
//                   SizedBox(height: 20,),
//                   Text(
//                     'Vezoh',
//                     style: TextStyle(
//                       color: AppColors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       height: 1.2, // tighter line height
//                     ),
//                   ),
//                   SizedBox(height: 10), // reduced from 5
//                   Text(
//                     'Your trusted transport & delivery partner',
//                     style: TextStyle(
//                       color: AppColors.white,
//                       fontSize: 13, // optional: slightly smaller
//                       height: 1.2, // tighter line height
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 30),
//
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Center(
//                 child: Text(
//                   'Choose your service',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
//               child: Text(
//                 'Book rides, send packages, or transport goods',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 20),
//
//             // Book rides & deliveries option
//             _buildServiceOption(
//               icon: Icons.location_on,
//               title: 'Book rides & deliveries',
//               subtitle: 'Travel anywhere or send packages with ease',
//               onTap: () {
//                 Get.to(() => const GetStartedScreen());
//               },
//             ),
//
//             // Drive and earn option
//             _buildServiceOption(
//               icon: Icons.bar_chart,
//               title: 'Drive and earn',
//               subtitle: 'Make money driving with your vehicle',
//               onTap: () {
//
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildServiceOption({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap, // <-- New
//   }) {
//     return GestureDetector(
//       onTap: onTap, // <-- Trigger tap
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 30,
//                 backgroundColor: AppColors.skyBlue,
//                 child: Icon(icon, color: AppColors.white),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
