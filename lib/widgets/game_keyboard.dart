// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';
import 'package:wordle/widgets/game_board.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WordleGame game;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List row1 = 'QWERTYUIOP'.split('');
  List row2 = 'ASDFGHJKL'.split('');
  List row3 = ['DEL', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'SUBMIT'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WordleGame.game_message,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        GameBoard(widget.game),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1
              .map(
                (e) => InkWell(
                  onTap: (() {
                    print(e);
                    if (widget.game.letterId < 5) {
                      setState(() {
                        widget.game
                            .insertWord(widget.game.letterId, Letter(e, 0));
                        widget.game.letterId++;
                      });
                    }
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300),
                    child: Text(
                      "$e",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2
              .map(
                (e) => InkWell(
                  onTap: (() {
                    print(e);
                    if (widget.game.letterId < 5) {
                      setState(() {
                        widget.game
                            .insertWord(widget.game.letterId, Letter(e, 0));
                        widget.game.letterId++;
                      });
                    }
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300),
                    child: Text(
                      "$e",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3
              .map(
                (e) => InkWell(
                  onTap: (() {
                    print(e);
                    if (e == 'DEL') {
                      if (widget.game.letterId > 0) {
                        setState(() {
                          widget.game.insertWord(
                              widget.game.letterId - 1, Letter('', 0));
                          widget.game.letterId--;
                        });
                      }
                    } else if (e == 'SUBMIT') {
                      if (widget.game.letterId >= 5) {
                        String guess = widget
                            .game.wordleBoard[widget.game.rowID]
                            .map((e) => e.letter)
                            .join();
                        if (widget.game.checkWordExist(guess)) {
                          if (guess == WordleGame.game_guess) {
                            setState(() {
                              WordleGame.game_message = 'Congratulations';
                              for (var element in widget
                                  .game.wordleBoard[widget.game.rowID]) {
                                element.code = 1;
                              }
                            });
                          } else {
                            int listLength = guess.length;
                            for (int i = 0; i < listLength; i++) {
                              String char = guess[i];
                              if (WordleGame.game_guess.contains(char)) {
                                //checking if the letter in the word or not
                                if (WordleGame.game_guess[i] == char) {
                                  //checking if two letters has same id
                                  setState(() {
                                    widget
                                        .game
                                        .wordleBoard[widget.game.rowID][i]
                                        .code = 1;
                                  });
                                } else {
                                  setState(() {
                                    widget
                                        .game
                                        .wordleBoard[widget.game.rowID][i]
                                        .code = 2;
                                  });
                                }
                              }
                            }
                            widget.game.rowID++;
                            widget.game.letterId = 0;
                          }
                        } else {
                          WordleGame.game_message =
                              'The word does not exist try again';
                        }
                      }
                    } else {
                      if (widget.game.letterId < 5) {
                        setState(() {
                          widget.game
                              .insertWord(widget.game.letterId, Letter(e, 0));
                          widget.game.letterId++;
                        });
                      }
                    }
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade300),
                    child: Text(
                      "$e",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
