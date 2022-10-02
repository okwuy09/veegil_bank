import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<UsersList> data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        status: json["status"],
        message: json["message"],
        data: List<UsersList>.from(
            json["data"].map((x) => UsersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UsersList {
  UsersList({
    this.phoneNumber,
    this.balance,
    required this.created,
  });

  String? phoneNumber;
  double? balance;
  DateTime created;

  factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
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
