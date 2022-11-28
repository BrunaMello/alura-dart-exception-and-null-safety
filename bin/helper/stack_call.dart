import 'dart:io';

void stackStart() {
  print("Started Main");
  functionOne();
  print("Finished Main");
}

void functionOne() {
  print("Started F01");
  // try { functionTwo();
  // } on FormatException catch (e) {
  //   print("Was captured inside the FunctionOne");
  //   print(e.message);
  //   print(e.source);
  //   print(e.toString());
  // } on IOException catch (e) {
  //   print("IOException was captured inside the FunctionOne");
  //   print(e.toString());
  // } on Exception catch (e) {
  //   print(e.toString());
  // }

  try { functionTwo();
  } catch (exception, stackTrace) {
    print(exception);
    print(stackTrace);
    rethrow;
  } finally {
    print("Finally");
  }
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for (var i = 1; i < 5; i++){
    print("F02: $i");
    double amount = double.parse("Not a number");
  }
  print("Finished F02");
}
