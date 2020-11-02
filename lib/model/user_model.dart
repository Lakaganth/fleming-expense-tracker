//User Model
import 'package:fleming_expense_tracker/model/trip_model.dart';

class UserModel {
  String uid;
  String email;
  String name;
  String photoUrl;
  // List<String> adminTripId;

  UserModel({
    this.uid,
    this.email,
    this.name,
    this.photoUrl,
    // this.adminTripId,
  });

  factory UserModel.fromMap(Map data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
      // adminTripId: data['adminTripId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "photoUrl": photoUrl,
        // "adminTripId": adminTripId,
      };

  static List<UserModel> listFromJson(List<dynamic> list) {
    List<UserModel> rows = list.map((i) => UserModel.fromMap(i)).toList();
    return rows;
  }
}
