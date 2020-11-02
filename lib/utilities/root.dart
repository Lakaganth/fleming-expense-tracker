import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/controllers/user_controller.dart';
import 'package:fleming_expense_tracker/model/user_model.dart';
import 'package:fleming_expense_tracker/screens/1.splash_screens/onboarding_screen.dart';
import 'package:fleming_expense_tracker/screens/2.authenitication/login_screen.dart';
import 'package:fleming_expense_tracker/screens/3.dashboard/dashboard_screen.dart';
import 'package:fleming_expense_tracker/screens/3.dashboard/sidebar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  // final authController = Get.put(AuthController());
  // final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// class Root extends StatelessWidget {
//   // final authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Get.find<AuthController>().onAuthStateChanged,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           print(snapshot.data);
//           if (snapshot.data.isNull) {
//             return OnboardingScreen();
//           } else {
//             return DashboardScreen();
//           }
//         } else {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
