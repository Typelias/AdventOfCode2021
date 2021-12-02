import 'dart:io';
import 'package:collection/collection.dart';

List<int> readInput() {
  List<int> list = [];

  var res = File("bin/inputs.txt").readAsLinesSync();
  list = res.map((e) => int.parse(e)).toList();

  return list;
}

void partOne() {
  List<int> depthList = readInput();
  int numberOfIncrements = 0;
  int prevDepth = -1;
  for (var element in depthList) {
    if (prevDepth == -1) {
      prevDepth = element;
      continue;
    }
    if (prevDepth < element) {
      numberOfIncrements++;
    }
    prevDepth = element;
  }
  print("Number of increments: $numberOfIncrements");
}

void partTwo() {
  //final list = readInput();
  const list = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263];
  int numberOfIncrements = 0;
  int prevSum = -1;
  for (var i = 2; i < list.length - 3; i++) {
    if (prevSum == -1) {
      prevSum = list.sublist(i, i + 2).sum;
      print(prevSum);
      continue;
    }
    final sum = list.sublist(i, i + 2).sum;
    print(sum);
  }
}

void main(List<String> arguments) {
  //partOne();
  partTwo();
}
