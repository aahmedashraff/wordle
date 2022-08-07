// ignore_for_file: non_constant_identifier_names

import 'dart:math';

class WordleGame {
  int rowID = 0;
  int letterId = 0;
  static String game_message = '';
  static String game_guess = '';
  static List<String> word_list = [
    'WORLD',
    'FIGHT',
    'BRAIN',
    'PLANE',
    'EARTH',
    'ROBOT'
  ];
  static bool gameOver = false;
  //setting the game row
  static List<Letter> wordleRow = List.generate(5, (index) => Letter('', 0));
  //setting the game board

  List<List<Letter>> wordleBoard =
      List.generate(5, (index) => List.generate(5, (index) => Letter('', 0)));
  //setting the game basic functions
  static void initGame() {
    final random = Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index];
  }

  //setting the game insertion
  void insertWord(index, word) {
    wordleBoard[rowID][index] = word;
  }

  bool checkWordExist(String word) {
    return word_list.contains(word);
  }
}

class Letter {
  String? letter;
  int code = 0;
  Letter(this.letter, this.code);
}
