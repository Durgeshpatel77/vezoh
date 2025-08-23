// import 'package:get/get.dart';
//
// class GetStartedController extends GetxController {
//   var code = ''.obs;
//   var isCodeValid = false.obs;
//   String verificationId = '';
//
//   @override
//   void onInit() {
//     ever(code, (_) => isCodeValid.value = code.value.length == 6);
//     super.onInit();
//   }
//
//   void sendOTP(String phoneNumber) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 60),
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Auto-retrieval or instant verification
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         Get.offAllNamed('/home'); // Navigate to home
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         Get.snackbar("Verification Failed", e.message ?? "Unknown error");
//       },
//       codeSent: (String verId, int? resendToken) {
//         verificationId = verId;
//         Get.snackbar("OTP Sent", "Please check your phone.");
//       },
//       codeAutoRetrievalTimeout: (String verId) {
//         verificationId = verId;
//       },
//     );
//   }
//
//   void verifyOTP(String smsCode) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: smsCode,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       Get.offAllNamed('/home');
//     } catch (e) {
//       Get.snackbar("Verification Failed", "Invalid OTP or expired.");
//     }
//   }
// }
