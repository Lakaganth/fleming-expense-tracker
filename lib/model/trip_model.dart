import 'dart:convert';
import 'package:fleming_expense_tracker/model/user_model.dart';
import 'package:flutter/foundation.dart';

class TripModel {
  String tripId;
  String tripAdminId;
  String tripName;
  String destination;
  String origin;
  String homeCurrency;
  String destinationCurrency;
  List<UserModel> teamMembers;
  double travelBudget;
  double foodBudget;
  double projBudget;

  TripModel({
    this.tripId,
    @required this.tripAdminId,
    @required this.tripName,
    @required this.destination,
    @required this.origin,
    @required this.homeCurrency,
    @required this.destinationCurrency,
    this.teamMembers,
    this.travelBudget,
    this.foodBudget,
    this.projBudget,
  });

  factory TripModel.fromMap(Map data) {
    return TripModel(
      tripId: data['tripId'],
      tripAdminId: data['tripAdminId'] ?? '',
      tripName: data['tripName'] ?? '',
      destination: data['destination'] ?? '',
      origin: data['origin'] ?? '',
      homeCurrency: data['homeCurrency'] ?? '',
      destinationCurrency: data['destinationCurrency'] ?? '',
      teamMembers: data['teamMembers'] == null
          ? []
          : UserModel.listFromJson(data['teamMembers']),
      travelBudget: data['travelBudget'] ?? '',
      foodBudget: data['foodBudget'] ?? '',
      projBudget: data['projBudget'] ?? '',
    );
  }

  static List<TripModel> listFromJson(List<dynamic> list) {
    List<TripModel> rows = list.map((i) => TripModel.fromMap(i)).toList();
    return rows;
  }

  static List<TripModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<TripModel>((json) => TripModel.fromMap(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'tripAdminId': tripAdminId,
        'tripName': tripName,
        'destination': destination,
        'origin': origin,
        'homeCurrency': homeCurrency,
        'destinationCurrency': destinationCurrency,
        'teamMembers': teamMembers,
        'travelBudget': travelBudget,
        'foodBudget': foodBudget,
        'projBudget': projBudget,
      };
}
