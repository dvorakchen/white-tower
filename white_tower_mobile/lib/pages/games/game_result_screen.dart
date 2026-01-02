import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/models/game.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';

class GameResultScreen extends ConsumerWidget {
  final GameResult gameResult;
  const GameResultScreen({super.key, required this.gameResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(gameResultProvider);
    final cs = ref.read(appThemeProvider);

    return Container(
      color: cs.base100,
      child: Text('${gameResult.list.length}'),
    );
  }
}
