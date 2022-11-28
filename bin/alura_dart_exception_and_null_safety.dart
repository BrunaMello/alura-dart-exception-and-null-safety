void main() {
  print("Started Main");
  functionOne();
  print("Finished Main");
}

void functionOne() {
  print("Started F01");
  functionTwo();
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for (var i = 0; i < 5; i++){
    print("F02: $i");
  }
  print("Finished F02");
}
