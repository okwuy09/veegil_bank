import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:veegil_bank/model/account_list.dart';
import 'package:veegil_bank/model/transaction.dart';
import 'package:veegil_bank/model/users.dart';

class Data with ChangeNotifier {
  /// Register and signUp as new User
  bool isSignUp = false;
  Future<http.Response> signUp(String phone, String password) async {
    isSignUp = true;
    notifyListeners();
    var body = jsonEncode({'phoneNumber': phone, 'password': password});
    http.Response response =
        await http.post(Uri.parse('https://bank.veegil.com/auth/signup'),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
            },
            body: body);
    isSignUp = false;
    notifyListeners();
    return response;
  }

  /// authenticated user login
  bool isSignIn = false;
  Future<http.Response> signIn(String phone, String password) async {
    isSignIn = true;
    notifyListeners();
    var body = jsonEncode({'phoneNumber': phone, 'password': password});
    http.Response response =
        await http.post(Uri.parse('https://bank.veegil.com/auth/login'),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
            },
            body: body);
    isSignIn = false;
    notifyListeners();
    return response;
  }

  /// Trasnfer money
  bool isTransfer = false;
  Future<http.Response> transfer(String phone, String amount) async {
    isTransfer = true;
    notifyListeners();
    var body = jsonEncode({'phoneNumber': phone, 'amount': amount});
    http.Response response =
        await http.post(Uri.parse('https://bank.veegil.com/accounts/transfer'),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
            },
            body: body);
    isTransfer = false;
    notifyListeners();
    return response;
  }

  /// Withdraw money
  bool isWithdraw = false;
  Future<http.Response> withdraw(String phone, String amount) async {
    isWithdraw = true;
    notifyListeners();
    var body = jsonEncode({'phoneNumber': phone, 'amount': amount});

    http.Response response =
        await http.post(Uri.parse('https://bank.veegil.com/accounts/withdraw'),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
            },
            body: body);
    isWithdraw = false;
    notifyListeners();
    return response;
  }

  /// fetch transaction
  Future<List<TransactionData>> fetchAllTransaction() async {
    final response = await http
        .get(Uri.parse('https://bank.veegil.com/transactions'), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<TransactionData> transaction = data['data']
          .map<TransactionData>((model) =>
              TransactionData.fromJson(model as Map<String, dynamic>))
          .toList();
      //notifyListeners();
      return transaction;
    } else {
      throw Exception('Failed to load transaction');
    }
  }

  /// fetch Account
  Future<List<AccountData>> fetchAllAccount() async {
    final response = await http
        .get(Uri.parse('https://bank.veegil.com/accounts/list'), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<AccountData> account = data['data']
          .map<AccountData>(
              (model) => AccountData.fromJson(model as Map<String, dynamic>))
          .toList();
      //notifyListeners();
      return account;
    } else {
      throw Exception('Failed to load accountList');
    }
  }

  /// fetch All users
  Future<List<UsersList>> fetchAllUsers() async {
    final response = await http
        .get(Uri.parse('https://bank.veegil.com/auth/users'), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<UsersList> users = data['data']
          .map<UsersList>(
              (model) => UsersList.fromJson(model as Map<String, dynamic>))
          .toList();
      return users;
    } else {
      throw Exception('Failed to load All Users');
    }
  }
}
