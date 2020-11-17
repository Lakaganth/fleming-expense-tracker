import 'package:fleming_expense_tracker/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExpenseDashboardScreen extends StatelessWidget {
  final TripModel trip;
  final String tripId;

  ExpenseDashboardScreen({@required this.tripId, @required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          maxHeight: Get.height * .80,
          minHeight: 195.0,
          parallaxEnabled: true,
          parallaxOffset: .5,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0), topRight: Radius.circular(35.0)),
          body: Text(tripId),
          panel: ExpensePanel(),
        ),
      ),
    );
  }
}

class ExpensePanel extends StatelessWidget {
  const ExpensePanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Text("Panel"));
  }
}
