import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount =
      Account(name: "Bruna", balance: 200, isAuthenticated: true);

  // Extern connection simulate
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);

  print(myAccount.createdAt);
  print(myAccount.createdAt!.day);

  //direct converter (bad practice)
  // print(myAccount!.balance);

  // ternary operator
  print(myAccount != null ? myAccount.balance : "Null Account");

  //safe call
  // print(myAccount?.balance);

  if (myAccount != null) {
    print(myAccount.balance);
    if (myAccount.createdAt != null) {
      print(myAccount.createdAt!.day); //need to put !
    }
  }
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();
  //Account accountTest = Account(name: "", balance: -11, isAuthenticated: true);

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
      Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 50);
    // Observando resultado
    if(result){
      print("Transaction finished successfully");
    }
  } on SenderIdInvalidException catch (e){
    print(e);
    print("The sender ID: '${e.idSender}' is not valid.");
    print(e);
  } on ReceiverIdInvalidException catch (e){
    print(e);
    print("The receiver ID: '${e.idReceiver}' is not valid.");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);

    print("The sender ID: '${e.idSender}' is not authenticated");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("${e.idSender} tried to send a negative amount.");
    print("Sender Balance: '${e.senderBalance}'");
    print("Available amount: '${e.amount}' ");
  } on Exception {
    print("Something went wrong");
  }
}