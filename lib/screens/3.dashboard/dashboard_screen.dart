import 'package:fleming_expense_tracker/constants/constants.dart';
import 'package:fleming_expense_tracker/controllers/user_controller.dart';
import 'package:fleming_expense_tracker/screens/1.splash_screens/onboarding_screen.dart';
import 'package:fleming_expense_tracker/screens/3.dashboard/sidebar_screen.dart';
import 'package:fleming_expense_tracker/screens/3.dashboard/user_trips.dart';
import 'package:fleming_expense_tracker/services/user_database.dart';
import 'package:fleming_expense_tracker/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  final userController = Get.put(UserController());
  final authController = Get.put(AuthController());

  Animation<Offset> sidebarAnimation;
  Animation<double> fadeAnimation;
  AnimationController sidebarAnimationController;

  var sidebarHidden = true;
  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  void triggerAnimation() {
    setState(() {
      sidebarHidden = !sidebarHidden;
    });

    sidebarAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: AuthController(),
      builder: (_) => _?.firestoreUser?.value?.uid == null
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              body: Container(
                color: kBackgroundColor,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          Navbar(triggerAnimation),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  // "Hello",
                                  "Hello, ${authController.firestoreUser.value.name.capitalizeFirst}",
                                  style: kLargeHeading,
                                ),
                              ),
                            ],
                          ),
                          UserTrips(),
                        ],
                      ),
                    ),
                    IgnorePointer(
                      ignoring: sidebarHidden,
                      child: Stack(
                        children: [
                          FadeTransition(
                            opacity: fadeAnimation,
                            child: GestureDetector(
                              child: Container(
                                color: Color.fromRGBO(36, 38, 41, 0.4),
                                height: Get.height,
                                width: Get.width,
                              ),
                              onTap: () {
                                setState(() {
                                  sidebarHidden = !sidebarHidden;
                                });
                                sidebarAnimationController.reverse();
                              },
                            ),
                          ),
                          SlideTransition(
                            position: sidebarAnimation,
                            child: SafeArea(
                              child: SidebarScreen(),
                              bottom: false,
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
