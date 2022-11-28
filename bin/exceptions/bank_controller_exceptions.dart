class SenderIdInvalidException implements Exception {
  // properties
  static const String report = "SenderIdInvalidException";
  String idSender;
  SenderIdInvalidException({required this.idSender});

  @override
  String toString(){
    return "$report \nId Sender: $idSender \n";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";
  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString(){
    return "$report \nId Receiver: $idReceiver \n";
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";
  String idSender;
  SenderNotAuthenticatedException({required this.idSender});

  @override
  String toString(){
    return "$report \nId Receiver: $idSender \n";
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";
  String idSender;
  double senderBalance;
  double amount;

  SenderBalanceLowerThanAmountException({required this.idSender, required this.senderBalance, required this.amount});

  @override
  String toString(){
    return "$report \nId Sender: $idSender\n Sender Balance: $senderBalance\n Amount: $amount\n";
  }
}