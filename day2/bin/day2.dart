import 'dart:io';

enum Direction { fowrard, down, up }

class Position {
  int horizontal = 0;
  int depth = 0;
  int aim = 0;

  void navigatePt1(Command c) {
    switch (c.direction) {
      case Direction.fowrard:
        horizontal += c.units;
        break;
      case Direction.down:
        depth += c.units;
        break;
      case Direction.up:
        depth -= c.units;
        break;
      default:
        throw Exception("Command produced wrong Enum. How is this possible?😧");
    }
  }

  void navigatept2(Command c) {
    switch (c.direction) {
      case Direction.fowrard:
        horizontal += c.units;
        depth += aim * c.units;
        break;
      case Direction.down:
        aim += c.units;
        break;
      case Direction.up:
        aim -= c.units;
        break;
      default:
        throw Exception("Command produced wrong Enum. How is this possible?😧");
    }
  }
}

class Command {
  final Direction direction;
  final int units;

  Command(this.direction, this.units);

  static Direction parseDirection(String input) {
    Direction ret;
    switch (input) {
      case "forward":
        ret = Direction.fowrard;
        break;
      case "down":
        ret = Direction.down;
        break;
      case "up":
        ret = Direction.up;
        break;
      default:
        throw Exception("Invalid input in direction parsing: $input");
    }
    return ret;
  }

  static List<Command> createCommandList(List<String> input) {
    return input.map((e) {
      var split = e.split(" ");
      return Command(Command.parseDirection(split[0]), int.parse(split[1]));
    }).toList();
  }
}

List<String> getInput() {
  return File("bin/input.txt").readAsLinesSync();
}

void part1(List<Command> list) {
  var pos = Position();
  list.forEach((element) => pos.navigatePt1(element));
  print("Part1:");
  print(
      "Depth and horizontal position product is ${pos.depth * pos.horizontal}");
}

void part2(List<Command> list) {
  var pos = Position();
  list.forEach((element) => pos.navigatept2(element));
  print("Part2:");
  print(
      "Depth and horizontal position product is ${pos.depth * pos.horizontal}");
}

void main(List<String> arguments) {
  var list = Command.createCommandList(getInput());
  part1(list);
  part2(list);
}
