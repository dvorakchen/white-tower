import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/models/game.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';
import 'package:white_tower_mobile/widgets/components/button.dart';

class GameResultScreen extends ConsumerWidget {
  final GameResult gameResult;
  const GameResultScreen({super.key, required this.gameResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(gameResultProvider);
    final cs = ref.read(appThemeProvider);

    return Container(
      color: cs.base100,
      child: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                '答对题目数量：${gameResult.list.where((t) => t.isCorrect).length}',
              ),
              Text(
                '答错题目数量：${gameResult.list.where((t) => !t.isCorrect).length}',
              ),
              Button(
                onPress: () {
                  context.pop();
                },
                label: '返回',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
