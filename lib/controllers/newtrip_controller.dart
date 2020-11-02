import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleming_expense_tracker/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewtripController extends GetxController {
  static NewtripController to = Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rx<TripModel> tripModel = Rx<TripModel>();

  TripModel get newTrip => tripModel.value;

  TextEditingController tripnameController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController homeCurrencyController = TextEditingController();
  TextEditingController destinationCurrencyController = TextEditingController();
  TextEditingController travelBudgetController = TextEditingController();
  TextEditingController foodBudgetController = TextEditingController();
  TextEditingController projBudgetController = TextEditingController();

  addNewTrip(String adminId) async {
    try {
      //Create new trip
      TripModel tripModel = TripModel(
        tripAdminId: adminId,
        tripName: tripnameController.text,
        destination: destinationController.text,
        origin: originController.text,
        homeCurrency: homeCurrencyController.text,
        destinationCurrency: destinationCurrencyController.text,
        // travelBudget: double.parse(travelBudgetController.text),
        // foodBudget: double.parse(tripnameController.text),
        // projBudget: double.parse(projBudgetController.text),
      );

      // Add to DB
      // await _db.doc('/trip/').set(tripModel.toJson());
      await _db.collection("trip").add(tripModel.toJson());

      Get.snackbar(
          'Success', 'New Trip to ${tripModel.destination} has been created');
    } catch (err) {
      Get.snackbar("User creation error", err.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }
}
