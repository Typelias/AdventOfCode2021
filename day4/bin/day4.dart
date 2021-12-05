import 'dart:io';

class BingoBoard {
  final List<List<int>> board;
  late List<List<bool>> checked;

  BingoBoard(this.board) {
    int width = board[0].length;
    int height = board.length;
    checked = List.filled(height, List.filled(width, false));
  }

  static List<BingoBoard> createBoards(List<String> input) {
    List<BingoBoard> ret = [];
    List<List<int>> temp = [];
    for (var i = 0; i < input.length; i++) {
      if (i % 4 == 0) {
        ret.add(BingoBoard(temp));
        temp.clear();
      }
      //add to temp
    }
    return ret;
  }

  void printList() {
    for (var element in board) {
      print(element);
    }
  }
}

List<String> getInput() {
  return File('bin/test.txt').readAsLinesSync();
}

void main(List<String> arguments) {
  final input = getInput();
  input.removeWhere((element) => element.isEmpty);
  final numbers = input.first.split(",").map((e) => int.parse(e)).toList();
  input.removeAt(0);
  final boards = BingoBoard.createBoards(input);
  for (var element in boards) {
    element.printList();
  }
}
