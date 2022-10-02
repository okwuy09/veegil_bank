// To parse this JSON data, do
//
//     final accountLIst = accountLIstFromJson(jsonString);

import 'dart:convert';

AccountLIst accountLIstFromJson(String str) =>
    AccountLIst.fromJson(json.decode(str));

String accountLIstToJson(AccountLIst data) => json.encode(data.toJson());

class AccountLIst {
  AccountLIst({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<AccountData> data;

  factory AccountLIst.fromJson(Map<String, dynamic> json) => AccountLIst(
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
  int? balance;
  DateTime created;

  factory AccountData.fromJson(Map<String, dynamic> json) => AccountData(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"] == null ? null : json["balance"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "balance": balance == null ? null : balance,
        "created": created.toIso8601String(),
      };
}
