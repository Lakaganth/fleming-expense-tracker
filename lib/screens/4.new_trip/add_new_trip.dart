import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:fleming_expense_tracker/controllers/user_controller.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewTrip extends StatelessWidget {
  final NewtripController trip = Get.put(NewtripController());
  final UserController userController = Get.put(UserController());
  final AuthController authController = Get.put(AuthController());

  newTrip() {
    trip.addNewTrip(authController.firebaseUser.value.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black38,
          width: Get.width,
          height: Get.height,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildNewTripRow(
                    label: "Name",
                    labelColor: Colors.white,
                    controller: trip.tripnameController,
                    hintText: "Enter name for the trip",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BuildNewTripRow(
                    label: "Destination",
                    labelColor: Colors.white,
                    controller: trip.destinationController,
                    hintText: "Enter destination",
                  ),
                  BuildNewTripRow(
                    label: "Origin",
                    labelColor: Colors.white,
                    controller: trip.originController,
                    hintText: "Enter Origin",
                  ),
                  BuildNewTripRow(
                    label: "Home currency",
                    labelColor: Colors.white,
                    controller: trip.homeCurrencyController,
                    hintText: " ",
                  ),
                  BuildNewTripRow(
                    label: "Destination Currency",
                    labelColor: Colors.white,
                    controller: trip.destinationCurrencyController,
                    hintText: " ",
                  ),
                  BuildNewTripRow(
                    label: "Travel budget",
                    labelColor: Colors.white,
                    controller: trip.travelBudgetController,
                    hintText: "",
                  ),
                  BuildNewTripRow(
                    label: "Food Budget",
                    labelColor: Colors.white,
                    controller: trip.foodBudgetController,
                    hintText: "",
                  ),
                  BuildNewTripRow(
                    label: "Project Budget",
                    labelColor: Colors.white,
                    controller: trip.projBudgetController,
                    hintText: "",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomRaisedButtton(
                    onPressed: () {
                      newTrip();
                    },
                    buttonText: "Submit",
                    buttonColor: Colors.white,
                    buttonTextColor: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildNewTripRow extends StatelessWidget {
  const BuildNewTripRow({
    @required this.label,
    @required this.labelColor,
    @required this.controller,
    @required this.hintText,
  });

  final String label;
  final Color labelColor;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   label,
        //   style: GoogleFonts.robotoMono(
        //     fontSize: 20.0,
        //     color: labelColor,
        //   ),
        // ),
        Container(
          width: Get.width / 1.5,
          child: TextField(
            controller: controller,
            // TODO Build focusnodes
            decoration: InputDecoration(
              // enabledBorder: InputBorder.none,
              hintText: hintText,
              labelText: label,
              labelStyle: GoogleFonts.robotoMono(
                fontSize: 18.0,
                color: labelColor,
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            autocorrect: false,
            // onEditingComplete: (),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
        )
      ],
    );
  }
}
