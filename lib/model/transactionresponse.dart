// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

import 'dart:convert';

TransactionResponse transactionResponseFromJson(String str) =>
    TransactionResponse.fromJson(json.decode(str));

String transactionResponseToJson(TransactionResponse data) =>
    json.encode(data.toJson());

class TransactionResponse {
  TransactionResponse({
    required this.errors,
    required this.transDetails,
  });

  dynamic errors;
  List<TransDetail> transDetails;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        errors: json["errors"],
        transDetails: List<TransDetail>.from(
            json["transDetails"].map((x) => TransDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors,
        "transDetails": List<dynamic>.from(transDetails.map((x) => x.toJson())),
      };
}

class TransDetail {
  TransDetail({
    required this.day,
    required this.date,
    required this.checkInTime,
    required this.checkInData,
    required this.checkoutTime,
    required this.checkoutData,
  });

  String day;
  String date;
  String checkInTime;
  String checkInData;
  String checkoutTime;
  String checkoutData;

  factory TransDetail.fromJson(Map<String, dynamic> json) => TransDetail(
        day: json["day"],
        date: json["date"],
        checkInTime: json["checkInTime"],
        checkInData: json["checkInData"],
        checkoutTime: json["checkoutTime"],
        checkoutData: json["CheckoutData"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "date": date,
        "checkInTime": checkInTime,
        "checkInData": checkInData,
        "checkoutTime": checkoutTime,
        "CheckoutData": checkoutData,
      };
}
