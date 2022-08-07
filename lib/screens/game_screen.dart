import 'package:flutter/material.dart';
import 'package:wordle/utils/game_provider.dart';
import 'package:wordle/widgets/game_keyboard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final WordleGame _game = WordleGame();
  late String word;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WordleGame.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Wordle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GameKeyboard(_game),
        ],
      ),
    );
  }
}
