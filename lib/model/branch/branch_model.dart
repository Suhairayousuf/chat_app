// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

BranchModel branchModelFromJson(String str) => BranchModel.fromJson(json.decode(str));

String branchModelToJson(BranchModel data) => json.encode(data.toJson());

class BranchModel {
  String branchName;
  String branchId;
  DateTime date;
  List<dynamic> admins;
  String phoneNumber;
  String email;
  String branchAddress;
  bool block;
  bool delete;

  BranchModel({
    required this.branchName,
    required this.branchId,
    required this.date,
    required this.admins,
    required this.phoneNumber,
    required this.branchAddress,
    required this.email,
    required this.block,
    required this.delete,
  });

  BranchModel copyWith({
    String? branchName,
    String? branchId,
    DateTime? date,
    List<dynamic>? admins,
    String? phoneNumber,
    String? email,
    String? branchAddress,
    bool? block,
    bool? delete,
  }) =>
      BranchModel(
        branchName: branchName ?? this.branchName,
        branchId: branchId ?? this.branchId,
        date: date ?? this.date,
        admins: admins ?? this.admins,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        branchAddress: branchAddress ?? this.branchAddress,
        email: email ?? this.email,
        block: block ?? this.block,
        delete: delete ?? this.delete,
      );

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
    branchName: json["branchName"],
    branchId: json["branchId"],
    date: json["date"].toDate(),
    admins: List<dynamic>.from(json["admins"].map((x) => x)),
    phoneNumber: json["phoneNumber"],
    branchAddress: json["branchAddress"],
    delete: json["delete"],
    block: json["block"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "branchName": branchName,
    "branchId": branchId,
    "date": date,
    "admins": List<dynamic>.from(admins.map((x) => x)),
    "phoneNumber": phoneNumber,
    "branchAddress": branchAddress,
    "delete": delete,
    "block": block,
    "email": email,
  };
}
