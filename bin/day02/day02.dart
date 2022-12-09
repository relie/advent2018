import 'dart:convert';
import 'dart:io';

void day02() {
  File('./bin/day02/input.txt').readAsString().then((String contents) {
    // part1(LineSplitter().convert(contents));
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  int dupeCnt = 0;
  int tripeCnt = 0;
  for (final line in input) {
    bool withDupe = false;
    bool withTripe = false;
    List<String> chars = line.split('');
    while (chars.isNotEmpty) {
      String test = chars.first;
      int cnt = getMatchCnt(chars.first, chars.sublist(1));
      print('Matches for $test: $cnt.');
      if (cnt == 1) {
        withDupe = true;
      } else if (cnt == 2) {
        withTripe = true;
      }
      chars.removeWhere((element) => element == test);
    }

    if (withDupe) {
      dupeCnt++;
    }

    if (withTripe) {
      tripeCnt++;
    }
  }

  print('Dupes are $dupeCnt and tripes are $tripeCnt. Checksum is ${dupeCnt*tripeCnt}');
}

int getMatchCnt(String char, List<String> chars) {
  if (chars.isEmpty) {
    return 0;
  }

  if (char == chars.first) {
    return 1 + getMatchCnt(char, chars.sublist(1));
  }
  return 0 + getMatchCnt(char, chars.sublist(1));
}

void part2(List<String> input) {
  for (int r = 0; r < input.length; r++) {
    for (int l = r+1; l < input.length; l++) {
      // print('Comparing lines ${input[r]} and ${input[l]}');
      List<String> diffs = [];
      List<String> rChars = input[r].split('');
      List<String> lChars = input[l].split('');
      for (int y = 0; y < rChars.length; y++) {
        if (rChars[y] != lChars[y]) {
          diffs.add(rChars[y]);
        }
      }
      // print('The difference: ${diffs.join("")}.');
      if (diffs.length == 1) {
        print('Resulting code is ${input[r].replaceAll(diffs[0], '')}');
      }
    }
  }
}