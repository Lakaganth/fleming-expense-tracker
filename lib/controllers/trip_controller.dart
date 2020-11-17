import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleming_expense_tracker/controllers/auth_controller.dart';
import 'package:fleming_expense_tracker/model/trip_model.dart';
import 'package:get/get.dart';

class TripController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // RxList<TripModel> adminTrips = [].obs;
  Rx<List<TripModel>> userTrips = Rx<List<TripModel>>();

  List<TripModel> get trips => userTrips.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().firestoreUser.value.uid;
    getUserAllTrips(uid);
  }

  void getUserAllTrips(String uid) {
    userTrips.bindStream(userTripsStream(uid));
  }

  Stream<List<TripModel>> userTripsStream(String uid) {
    return _db
        .collection("trip")
        .where("teamMembers", arrayContains: uid)
        .snapshots()
        .map((QuerySnapshot trip) {
      List<TripModel> userTripFromJson = List();
      trip.docs.forEach((element) {
        userTripFromJson.add(TripModel.fromMap(element.id, element));
      });
      return userTripFromJson;
    });
  }
}
