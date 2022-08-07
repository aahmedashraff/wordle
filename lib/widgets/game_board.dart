// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';

class GameBoard extends StatefulWidget {
  GameBoard(this.game, {Key? key}) : super(key: key);
  WordleGame game;
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.game.wordleBoard
          .map((e) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map((e) => Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 64,
                          height: 64,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: e.code == 0
                                  ? Colors.grey.shade800
                                  : e.code == 1
                                      ? Colors.green.shade400
                                      : Colors.amber.shade400),
                          child: Center(
                            child: Text(
                              e.letter!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList(),
    );
  }
}
