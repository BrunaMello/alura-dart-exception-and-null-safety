import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'helper/stack_call.dart';
import 'models/account.dart';

void main() {
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