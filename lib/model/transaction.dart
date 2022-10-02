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

  Type type;
  double? amount;
  String? phoneNumber;
  DateTime created;
  double? balance;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        type: json["type"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount == null ? null : amount,
        "phoneNumber": phoneNumber,
        "created": created.toIso8601String(),
        "balance": balance == null ? null : balance,
      };
}
