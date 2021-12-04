import 'dart:io';

List<String> getBits(String input) {
  int numberOfOnes = 0;
  int numberOfZeros = 0;
  for (var i = 0; i < input.length; i++) {
    if (input[i] == '1') {
      numberOfOnes++;
    } else {
      numberOfZeros++;
    }
  }
  if (numberOfOnes > numberOfZeros) return ["1", "0"];

  return ["0", "1"];
}

// List<int> getNumberOfBits(String input) {
//   int numberOfOnes = 0;
//   int numberOfZeros = 0;
//   for (var i = 0; i < input.length; i++) {
//     if (input[i] == '1') {
//       numberOfOnes++;
//     } else {
//       numberOfZeros++;
//     }
//   }
//   return [numberOfOnes, numberOfZeros];
// }

List<String> readInput() {
  return File("bin/input.txt").readAsLinesSync();
}

void part1(List<String> input) {
  List<String> strings = List.filled(input[0].length, "");
  for (var i = 0; i < strings.length; i++) {
    for (var item in input) {
      strings[i] += item[i];
    }
  }
  var gammaRateString = "";
  var epsilonRateString = "";
  for (var item in strings) {
    var temp = getBits(item);
    gammaRateString += temp[0];
    epsilonRateString += temp[1];
  }
  var gammeRate = int.parse(gammaRateString, radix: 2);
  var epsilonRate = int.parse(epsilonRateString, radix: 2);
  print(gammeRate);
  print(epsilonRate);
  print(gammeRate * epsilonRate);
}

List<String> getBitAtPosition(List<String> input, int index) {
  int numberOfOnes = 0;
  int numberOfZeros = 0;
  for (var item in input) {
    if (item[index] == "1") {
      numberOfOnes++;
    } else {
      numberOfZeros++;
    }
  }

  if (numberOfOnes >= numberOfZeros) return ["1", "0"];
  return ["0", "1"];
}

void part2(List<String> input) {
  List<String> oxygenList = List<String>.from(input);
  List<String> co2List = List<String>.from(input);
  for (var i = 0; i < input[0].length; i++) {
    var oxygenBits = getBitAtPosition(oxygenList, i);
    var co2Bits = getBitAtPosition(co2List, i);

    if (oxygenList.length != 1) {
      oxygenList.removeWhere((element) => element[i] == oxygenBits[1]);
    }
    if (co2List.length != 1) {
      co2List.removeWhere((element) => element[i] == co2Bits[0]);
    }
    if (oxygenList.length == 1 && co2List.length == 1) {
      break;
    }
  }
  print(
      "Lide Support Rating: ${int.parse(oxygenList[0], radix: 2) * int.parse(co2List[0], radix: 2)}");
}

void main(List<String> arguments) {
  // var input = [
  //   "00100",
  //   "11110",
  //   "10110",
  //   "10111",
  //   "10101",
  //   "01111",
  //   "00111",
  //   "11100",
  //   "10000",
  //   "11001",
  //   "00010",
  //   "01010"
  // ];
  var input = readInput();
  //part1(input);
  part2(input);
}
