import 'package:test/expect.dart';

class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account(
      {required this.name,
        required this.balance,
        required this.isAuthenticated}):
      assert(name.isNotEmpty, "name must not be empty"),
  assert(balance >=0, "balance must not be below 0");

  editBalance({required value}) {
    balance = balance + value;
  }
}