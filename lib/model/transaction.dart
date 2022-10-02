// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction({
    required this.status,
    required this.data,
  });

  String status;
  List<TransactionData> data;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        status: json["status"],
        data: List<TransactionData>.from(
            json["data"].map((x) => TransactionData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionData {
  TransactionData({
    required this.type,
    this.amount,
    this.phoneNumber,
    required this.created,
    this.balance,
  });

  String type;
  double? amount;
  String? phoneNumber;
  DateTime created;
  int? balance;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        type: json["type"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"] == null ? null : json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount == null ? null : amount,
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
        "balance": balance == null ? null : balance,
      };
}

// enum Type { CREDIT, DEBIT }

// final typeValues = EnumValues({"credit": Type.CREDIT, "debit": Type.DEBIT});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap ??= map.map((k, v) => MapEntry(v, k));
//     }
//     return reverseMap!;
//   }
// }
