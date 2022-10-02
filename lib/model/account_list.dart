import 'package:meta/meta.dart';
import 'dart:convert';

AccountsList accountsListFromJson(String str) =>
    AccountsList.fromJson(json.decode(str));

String accountsListToJson(AccountsList data) => json.encode(data.toJson());

class AccountsList {
  AccountsList({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<AccountData> data;

  factory AccountsList.fromJson(Map<String, dynamic> json) => AccountsList(
        status: json["status"],
        message: json["message"],
        data: List<AccountData>.from(
            json["data"].map((x) => AccountData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AccountData {
  AccountData({
    this.phoneNumber,
    this.balance,
    required this.created,
  });

  String? phoneNumber;
  double? balance;
  DateTime created;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "balance": balance == null ? null : balance,
        "created": created.toIso8601String(),
      };
}
