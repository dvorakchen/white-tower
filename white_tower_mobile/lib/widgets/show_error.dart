import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';

class ShowError extends ConsumerWidget {
  final Object error;

  const ShowError({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = ref.read(appThemeProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: cs.error),
            const SizedBox(height: 10),
            const Text(
              '问题加载失败',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '错误信息: $error',
              textAlign: TextAlign.center,
              style: TextStyle(color: cs.error),
            ),
          ],
        ),
      ),
    );
  }
}
