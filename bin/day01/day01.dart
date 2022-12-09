import 'dart:io';

void day01() {
  File('./bin/day01/input.txt').readAsString().then((String contents) {
    part02(contents.trim().split('\n'));
  });
}

void part01(List<String> input) {
  int sum = 0;
  for (final line in input) {
    if (line[0] == '+') {
      sum += int.parse(line.substring(1));
    } else if (line[0] == '-') {
      sum -= int.parse(line.substring(1));
    }
  }

  print('The resulting frequency is $sum');
}

void part02(List<String> input) {
  int sum = 0;
  List<int> visited = [0];
  int firstRepeat = 0;
  bool hasRepeat = false;
  for (int r = 0; r < input.length; r++) {
    String line = input[r];
    if (line[0] == '+') {
      sum += int.parse(line.substring(1));
    } else if (line[0] == '-') {
      sum -= int.parse(line.substring(1));
    }

    // print('Visited is $visited');
    if (!hasRepeat && visited.contains(sum)) {
      print('has repeated');
      firstRepeat = sum;
      hasRepeat = true;
    }

    visited.add(sum);

    if (!hasRepeat && r == input.length-1) {
      print('has repeated');
      r = -1;
    }
  }

  print('The first repeated frequency is $firstRepeat');
}
