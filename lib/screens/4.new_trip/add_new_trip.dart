import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewTrip extends StatelessWidget {
  final NewtripController trip = Get.put(NewtripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
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
                  controller: trip.destinationController,
                  hintText: "Enter Origin",
                ),
              ],
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
                fontSize: 25.0,
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
